From: Hsin-Yi Wang <hsinyi-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2, 3/3] mt8183: emi: add bandwidth driver support
Date: Thu, 11 Jul 2019 14:58:55 +0800
Message-ID: <CAJMQK-ih5UM0KJwK_6uziyQ1D7nU+1rcnOecp9uHEy_d+6fK7g@mail.gmail.com>
References: <1558670066-22484-1-git-send-email-xixi.chen@mediatek.com>
 <1558670066-22484-4-git-send-email-xixi.chen@mediatek.com>
 <CAJMQK-gTh-Zm8ct-DMsjee7H8GJKWxJ2BWW=YKXeinmAiW98gQ@mail.gmail.com>
 <1562827383.22938.7.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1562827383.22938.7.camel@mhfsdcap03>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Xi Chen <xixi.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

On Thu, Jul 11, 2019 at 2:43 PM Xi Chen <xixi.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:

>   I understand your idea, but emi driver stores the last 67ms bandwidth,
> and just the last 67ms, not all the time. So, we will move the array
> elements every 1ms.

We can still don't need to move the array elements every 1 ms for
keeping last 67ms.
The idea is like

original:
st                   ed
 |                      |
0, 1, 2, 3, .... 66

insert 67, move st and ed by 1, and 67 inserted to ed position:
ed  st
 |     |
67, 1, 2, 3,... 66

insert 68, move st and ed by 1, and 68 inserted to ed position:
      ed  st
        |   |
67, 68, 2, 3,... 66

But might be more complicated to implement this than current code, and
array size is small, so just an idea for your reference.
