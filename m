Return-Path: <SRS0=I3u4=7Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1F09C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2020 03:39:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C869A20835
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2020 03:39:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IqE8/Xn/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NjwK7zLT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C869A20835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XDkkRV0dIb/5kIBffKqqHRwMRnXgLd/ua60iUfRYhbA=; b=IqE8/Xn/eLlLjr
	3a1wUc/SoK5EpYt2BiKDIJf/BuNGJw1zBvcBmg4v9r5/2x7k0h3eMBfBdVKN+ANxvUFIpaifQKau/
	vuLH+WLsM6NvQtvcLJweJhPcXUOSzdCHNUxGbA2GNdjMZu7MZKDXKMS9CiVAP+vM4BQRGcGOT8fsX
	S+7MJrAtSBRdVhwImagxvOCloNdec9EpHBbcmF1jDcvldK6QYn93OMABH6XAtqkPi0UAa1BztpNqb
	uwpGDQN6CVAXboPMA+/KHwsP8iYh7BqAsaiW5o+VG72olGPhm38VRZ8swktHqoSvX3tt56k9TDu2B
	IBKQNMBZxGAeRP9hvYPQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjaXE-0007SF-IQ; Fri, 12 Jun 2020 03:39:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjaX7-0007Mi-5G; Fri, 12 Jun 2020 03:39:11 +0000
X-UUID: 89b5270884fc4c9bb9dcb06bfe50e7b6-20200611
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=2vt1fP2Pv2sBuK3kCBi7QAIK77QfXBuuHgboplad8oc=; 
 b=NjwK7zLTVflom0KTM61+KvD6VkOn1KKdeVOy3P+EQU1T5Xn0zs18Cv9pK6LT5cmzPFVaru4lMntgE4S+wyevBDwy2Vc+a1ckDg+yxqeeReS73hmjQ66612vRnZcRNErh7lg3CrUFMwWLYTsAb7yqBFARPW17F5DbOkdfi6q+oSw=;
X-UUID: 89b5270884fc4c9bb9dcb06bfe50e7b6-20200611
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 363178259; Thu, 11 Jun 2020 19:39:01 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 11 Jun 2020 20:38:52 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 12 Jun 2020 11:38:45 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 12 Jun 2020 11:38:44 +0800
Message-ID: <1591933130.15994.23.camel@mtkswgap22>
Subject: Re: [PATCH v2] usb/gadget/function: introduce Built-in CDROM support
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Date: Fri, 12 Jun 2020 11:38:50 +0800
In-Reply-To: <20200610143100.GB11727@rowland.harvard.edu>
References: <1591756349-17865-1-git-send-email-macpaul.lin@mediatek.com>
 <1591769718-3287-1-git-send-email-macpaul.lin@mediatek.com>
 <20200610143100.GB11727@rowland.harvard.edu>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200611_203909_211183_E10D9E4D 
X-CRM114-Status: GOOD (  25.61  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Felipe Balbi <balbi@kernel.org>, Hakieyin Hsieh <hakieyin@gmail.com>,
 Bart Van Assche <bvanassche@acm.org>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 Peter Chen <peter.chen@nxp.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Macpaul Lin <macpaul.lin@gmail.com>, Justin
 Hsieh <justinhsieh@google.com>, linux-arm-kernel@lists.infradead.org,
 EJ Hsu <ejh@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-06-10 at 10:31 -0400, Alan Stern wrote:
> On Wed, Jun 10, 2020 at 02:15:18PM +0800, Macpaul Lin wrote:
> > Introduce Built-In CDROM (BICR) support.
> > This feature depends on USB_CONFIGFS_MASS_STORAGE option.
> > 
> > 1. Some settings and new function is introduced for BICR.
> > 2. Some work around for adapting Android settings is introduced as well.
> 
> You're going to have to give a much better explanation of what this 
> does.  For people who don't know what Built-In CDROM support is, what 
> you wrote is meaningless.
> 
> For example, how is BICR support different from the CDROM support 
> already present in the driver?  And what's so special about it that it 
> needs its own kconfig setting?
> 
> > @@ -369,6 +372,10 @@ static void set_bulk_out_req_length(struct fsg_common *common,
> >  	if (rem > 0)
> >  		length += common->bulk_out_maxpacket - rem;
> >  	bh->outreq->length = length;
> > +
> > +	/* some USB 2.0 hardware requires this setting */
> > +	if (common->bicr)
> > +		bh->outreq->short_not_ok = 1;
> 
> How is this connected with BICR?  If some USB 2.0 hardware requires this 
> setting, shouldn't it always be turned on?
> 
> Besides, why does some hardware require this?  What goes wrong if 
> short_not_ok is set to 0?  If it causes problems, why didn't we become 
> aware of them many years ago?

Thanks for Alan and Greg's suggestion, we will check these issues and
see if a better solution could be work out.

> > @@ -527,7 +534,16 @@ static int fsg_setup(struct usb_function *f,
> >  				w_length != 1)
> >  			return -EDOM;
> >  		VDBG(fsg, "get max LUN\n");
> > -		*(u8 *)req->buf = _fsg_common_get_max_lun(fsg->common);
> > +		if (IS_ENABLED(USB_CONFIGFS_BICR) && fsg->common->bicr) {
> > +			/*
> > +			 * When Built-In CDROM is enabled,
> > +			 * we share only one LUN.
> > +			 */
> > +			*(u8 *)req->buf = 0;
> > +		} else {
> > +			*(u8 *)req->buf = _fsg_common_get_max_lun(fsg->common);
> > +		}
> 
> This is a very strange way of enforcing a single-LUN restriction.  Why 
> do it here?  A much more logical place would be where cfg->nluns is set 
> up originally.
> 
> > +		INFO(fsg, "get max LUN = %d\n", *(u8 *)req->buf);
> 
> This debugging line isn't needed.
> 
> >  		/* Respond with data/status */
> >  		req->length = min((u16)1, w_length);
> > @@ -1329,7 +1345,7 @@ static int do_start_stop(struct fsg_common *common)
> >  	}
> >  
> >  	/* Are we allowed to unload the media? */
> > -	if (curlun->prevent_medium_removal) {
> > +	if (!curlun->nofua && curlun->prevent_medium_removal) {
> 
> How is nofua connected to BICR?  Or to prevent_medium_removal?
> 
> >  		LDBG(curlun, "unload attempt prevented\n");
> >  		curlun->sense_data = SS_MEDIUM_REMOVAL_PREVENTED;
> >  		return -EINVAL;
> > @@ -2692,6 +2708,7 @@ int fsg_common_set_cdev(struct fsg_common *common,
> >  	common->ep0 = cdev->gadget->ep0;
> >  	common->ep0req = cdev->req;
> >  	common->cdev = cdev;
> > +	common->bicr = 0;
> >  
> >  	us = usb_gstrings_attach(cdev, fsg_strings_array,
> >  				 ARRAY_SIZE(fsg_strings));
> > @@ -2895,6 +2912,33 @@ static void fsg_common_release(struct fsg_common *common)
> >  		kfree(common);
> >  }
> >  
> > +#ifdef CONFIG_USB_CONFIGFS_BICR
> > +ssize_t fsg_bicr_show(struct fsg_common *common, char *buf)
> > +{
> > +	return sprintf(buf, "%d\n", common->bicr);
> > +}
> > +
> > +ssize_t fsg_bicr_store(struct fsg_common *common, const char *buf, size_t size)
> > +{
> > +	int ret;
> > +
> > +	ret = kstrtou8(buf, 10, &common->bicr);
> > +	if (ret)
> > +		return -EINVAL;
> > +
> > +	/* Set Lun[0] is a CDROM when enable bicr.*/
> > +	if (!strcmp(buf, "1"))
> > +		common->luns[0]->cdrom = 1;
> > +	else {
> > +		common->luns[0]->cdrom = 0;
> > +		common->luns[0]->blkbits = 0;
> > +		common->luns[0]->blksize = 0;
> > +		common->luns[0]->num_sectors = 0;
> > +	}
> > +
> > +	return size;
> > +}
> 
> Where do these attributes ever get exported to sysfs?
> 
> > +#endif
> >  
> >  /*-------------------------------------------------------------------------*/
> >  
> > @@ -3463,6 +3507,7 @@ void fsg_config_from_params(struct fsg_config *cfg,
> >  		lun->ro = !!params->ro[i];
> >  		lun->cdrom = !!params->cdrom[i];
> >  		lun->removable = !!params->removable[i];
> > +		lun->nofua = !!params->nofua[i];
> 
> Isn't this set already?  If not, it is a bug that has nothing to do with 
> BICR.
> 
> >  		lun->filename =
> >  			params->file_count > i && params->file[i][0]
> >  			? params->file[i]
> > diff --git a/drivers/usb/gadget/function/f_mass_storage.h b/drivers/usb/gadget/function/f_mass_storage.h
> > index 3b8c4ce2a40a..7097e2ea5cc9 100644
> > --- a/drivers/usb/gadget/function/f_mass_storage.h
> > +++ b/drivers/usb/gadget/function/f_mass_storage.h
> > @@ -140,5 +140,8 @@ void fsg_common_set_inquiry_string(struct fsg_common *common, const char *vn,
> >  void fsg_config_from_params(struct fsg_config *cfg,
> >  			    const struct fsg_module_parameters *params,
> >  			    unsigned int fsg_num_buffers);
> > -
> > +#ifdef CONFIG_USB_CONFIGFS_BICR
> > +ssize_t fsg_bicr_show(struct fsg_common *common, char *buf);
> > +ssize_t fsg_bicr_store(struct fsg_common *common, const char *buf, size_t size);
> > +#endif
> >  #endif /* USB_F_MASS_STORAGE_H */
> > diff --git a/drivers/usb/gadget/function/storage_common.c b/drivers/usb/gadget/function/storage_common.c
> > index f7e6c42558eb..8fe96eeddf35 100644
> > --- a/drivers/usb/gadget/function/storage_common.c
> > +++ b/drivers/usb/gadget/function/storage_common.c
> > @@ -441,6 +441,29 @@ ssize_t fsg_store_file(struct fsg_lun *curlun, struct rw_semaphore *filesem,
> >  		return -EBUSY;				/* "Door is locked" */
> >  	}
> >  
> > +	pr_notice("%s file=%s, count=%d, curlun->cdrom=%d\n",
> > +			__func__, buf, (int)count, curlun->cdrom);
> 
> Another debugging line that shouldn't be present in the final patch.
> 
> > +
> > +	/*
> > +	 * WORKAROUND for Android:
> > +	 *   VOLD would clean the file path after switching to bicr.
> > +	 *   So when the lun is being a CD-ROM a.k.a. BICR.
> > +	 *   Don't clean the file path to empty.
> > +	 */
> > +	if (curlun->cdrom == 1 && count == 1)
> > +		return count;
> > +
> > +	/*
> > +	 * WORKAROUND: Should be closed the fsg lun for virtual cd-rom,
> > +	 * when switch to other usb functions.
> 
> That is not a grammatical English sentence.
> 
> > +	 * Use the special keyword "off", because the init can
> > +	 * not parse the char '\n' in rc file and write into the sysfs.
> > +	 */
> > +	if (count == 3 &&
> > +			buf[0] == 'o' && buf[1] == 'f' && buf[2] == 'f' &&
> > +			fsg_lun_is_open(curlun))
> > +		((char *) buf)[0] = 0;
> 
> This seems like another bug fix that has no connection with BICR.
> 
> Alan Stern
> 
> > +
> >  	/* Remove a trailing newline */
> >  	if (count > 0 && buf[count-1] == '\n')
> >  		((char *) buf)[count-1] = 0;		/* Ugh! */
> > -- 
> > 2.18.0

Thanks!
Macpaul Lin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
