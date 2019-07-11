From: Xi Chen <xixi.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2, 3/3] mt8183: emi: add bandwidth driver support
Date: Thu, 11 Jul 2019 14:43:03 +0800
Message-ID: <1562827383.22938.7.camel@mhfsdcap03>
References: <1558670066-22484-1-git-send-email-xixi.chen@mediatek.com>
 <1558670066-22484-4-git-send-email-xixi.chen@mediatek.com>
 <CAJMQK-gTh-Zm8ct-DMsjee7H8GJKWxJ2BWW=YKXeinmAiW98gQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <CAJMQK-gTh-Zm8ct-DMsjee7H8GJKWxJ2BWW=YKXeinmAiW98gQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Hsin-Yi Wang <hsinyi-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

On Tue, 2019-06-18 at 17:40 +0800, Hsin-Yi Wang wrote:
> On Fri, May 24, 2019 at 3:54 AM Xi Chen <xixi.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> 
> > +struct mtk_emi {
> > +       struct device *dev;
> > +       void __iomem *cen_emi_base;
> > +       void __iomem *chn_emi_base[MAX_CH];
> > +       void __iomem *emi_mpu_base;
> > +
> > +       struct timer_list emi_bw_timer;
> > +       struct timeval old_tv;
> > +
> > +       unsigned long long emi_bw_array[EMI_BW_ARRAY_SIZE];
> > +       int emi_bw_cur_idx;
> > +};
> > +
> > +static unsigned long long emi_get_max_bw_in_last_array(struct device *dev,
> > +       unsigned long long arr[], unsigned int size)
> > +{
> > +       unsigned int i = 0;
> > +       unsigned long long max = arr[0];
> > +
> > +       while (i < size) {
> > +               if (arr[i] > max)
> > +                       max = arr[i];
> > +               ++i;
> > +       }
> > +       return max;
> > +}
> Would it better that if we store max element in mtk_emi struct{}, so
> that we don't need to scan entire array everytime to find max? Though
> array size only 67.
> This max element can be update in emi_update_bw_array().
	Yes, a good idea. Sorry, v3 doesn't contain the patch. I will try to
improve the codes on v4.
> 
> > +unsigned long long mtk_emi_get_max_bw(struct device *dev)
> > +{
> > +       struct mtk_emi *emi;
> > +
> > +       if (!dev)
> > +               return 0;
> > +
> > +       emi = dev_get_drvdata(dev);
> > +       return emi_get_max_bw_in_last_array(dev,
> > +               emi->emi_bw_array, ARRAY_SIZE(emi->emi_bw_array));
> > +}
> > +EXPORT_SYMBOL(mtk_emi_get_max_bw);
> > +
> > +static void emi_update_bw_array(struct device *dev, unsigned int val)
> > +{
> > +       struct mtk_emi *emi = dev_get_drvdata(dev);
> > +
> > +       if (emi->emi_bw_cur_idx == emi->EMI_BW_ARRAY_SIZE) {
> > +               /* remove the first array element */
> > +               memmove(emi->emi_bw_array, emi->emi_bw_array + 1,
> > +                       sizeof(unsigned long long) * (emi->EMI_BW_ARRAY_SIZE - 1));
> > +               emi->emi_bw_array[emi->EMI_BW_ARRAY_SIZE - 1] = val;
> > +       } else
> > +               emi->emi_bw_array[emi->emi_bw_cur_idx++] = val;
> > +}
> > +
> Is the order of the emi_bw_array important?
> If not, update latest element don't need to be at the end, so we don't
> need O(n) shift everytime when inserting new element.
> If the order is important, we can also do insert in O(1), by adding a
> pointer that points to the oldest element in array. When insert a new
> element, replace oldest element with latest one and move the pointer
> one space backward.
  I understand your idea, but emi driver stores the last 67ms bandwidth,
and just the last 67ms, not all the time. So, we will move the array
elements every 1ms.
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
