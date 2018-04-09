From: xiaolei li <xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/2] libmtd: Add support to access OOB available size
Date: Mon, 9 Apr 2018 17:01:27 +0800
Message-ID: <1523264487.14673.18.camel@mhfsdcap03>
References: <1523243410-65424-1-git-send-email-xiaolei.li@mediatek.com>
 <1523243410-65424-2-git-send-email-xiaolei.li@mediatek.com>
 <99d17022-0b07-a999-b6ac-05b51df7d18d@sigma-star.at>
 <1523258739.14673.7.camel@mhfsdcap03> <20180409093548.40b20d1b@bbrezillon>
 <1523262791.14673.12.camel@mhfsdcap03> <20180409103704.43a9aed7@bbrezillon>
 <1523263502.14673.17.camel@mhfsdcap03>
 <bec14308-33e1-d158-37d2-4f59047f0016@sigma-star.at>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <bec14308-33e1-d158-37d2-4f59047f0016-S6VGOU4v5edDinCvNWH78Q@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: David Oberhollenzer <david.oberhollenzer-S6VGOU4v5edDinCvNWH78Q@public.gmane.org>
Cc: Boris Brezillon <boris.brezillon-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Mon, 2018-04-09 at 10:53 +0200, David Oberhollenzer wrote:
> On 04/09/2018 10:45 AM, xiaolei li wrote:
> > On Mon, 2018-04-09 at 10:37 +0200, Boris Brezillon wrote:
> >> On Mon, 9 Apr 2018 16:33:11 +0800
> >> xiaolei li <xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> >>
> >>> Hi Boris,
> >>>
> >>> On Mon, 2018-04-09 at 09:35 +0200, Boris Brezillon wrote:
> >>>> On Mon, 9 Apr 2018 15:25:39 +0800
> >>>> xiaolei li <xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> >>>>   
> >>>>> Hi David,
> >>>>>
> >>>>> On Mon, 2018-04-09 at 08:58 +0200, David Oberhollenzer wrote:  
> >>>>>> Hi,
> >>>>>>
> >>>>>> On 04/09/2018 05:10 AM, Xiaolei Li wrote:    
> >>>>>>> @@ -769,6 +774,8 @@ int mtd_get_dev_info1(libmtd_t desc, int mtd_num, struct mtd_dev_info *mtd)
> >>>>>>>  		return -1;
> >>>>>>>  	if (dev_read_pos_int(lib->mtd_oob_size, mtd_num, &mtd->oob_size))
> >>>>>>>  		return -1;
> >>>>>>> +	if (dev_read_pos_int(lib->mtd_oobavail, mtd_num, &mtd->oobavail))
> >>>>>>> +		return -1;
> >>>>>>>  	if (dev_read_pos_int(lib->mtd_region_cnt, mtd_num, &mtd->region_cnt))
> >>>>>>>  		return -1;
> >>>>>>>  	if (dev_read_hex_int(lib->mtd_flags, mtd_num, &ret))    
> >>>>>>
> >>>>>> I'm not sure if it is a good idea to do a hard fail here, since this
> >>>>>> depends on a recent change to the kernel.
> >>>>>>
> >>>>>> It might be preferable to catch and handle ENOENT, otherwise the next
> >>>>>> release of mtd-utils will only work on the next kernel release onward.
> >>>>>>     
> >>>>> Yes, it is. The hard fail return here seems not good.
> >>>>>   
> >>>>>> Maybe mtd_oobavail could to be set to some reasonable default that
> >>>>>> retains the current behaviour on "older" kernels?
> >>>>>>     
> >>>>> What about setting 0 as default?  
> >>>>
> >>>> I didn't look closely at the code yet, but shouldn't we do something
> >>>> like:
> >>>>
> >>>> 1/ search for oobavail file in sysfs
> >>>> 2/ if it's not there use the GETOOBSEL or GETECCLAYOUT ioctl to get
> >>>>    this information  
> >>> MEMGETOOBSEL and GETECCLAYOUT are obsoleted. Should we keep using them
> >>> here?
> >>
> >> Yes we should, otherwise old kernels won't work with new versions of
> >> mtd-utils.
> > OK.
> > 
> > @David, do you have other comments? If no, I will work for next patch to
> > add GETOOBSEL/GETECCLAYOUT ioctl support as Boris's suggestion.
> > 
> > 
> 
> If a fallback to GETOOBSEL/GETECCLAYOUT works, I'm fine with that.

OK. Thanks.

> 
> Thanks,
> 
> David
