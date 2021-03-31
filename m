Return-Path: <SRS0=zLKe=I5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2043DC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 08:47:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD21961989
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 08:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD21961989
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MZflUB5PqrjdfudjL76JUMquGrlfk3LQJLPoJJmJygI=; b=CsxjQk87AjODKdm3n+ZDqwPa3
	J60YfnhMW2oDAtHnnFm9pJvau9tuBEXVr+2AlQicmNcRBof/6o+9N+haqv4cVjK7pQ6V9FoGYOhPk
	tyfb4HY9pB71ybc07npQB/rhBSmmpQUNCyu9o3qh3X7LtP44C9SMdqRSj9pTHRV4ABCWhoDKiakxE
	THIzGXJLsRV7wO52LI0P64wIHS0DAUIis4j2hzNLuU1GqeUxDUJqxMUIsV90UFAJB+VM5NCmHX2pv
	cMb+rdRCmsPd31ND3wzxn1XTuYkk6CYytJxwodxYsP8uMZrGUCnp2l09YwwSozdb3ka8Yl+4KE96x
	TQjLzMMQQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRWVE-0061RJ-Sf; Wed, 31 Mar 2021 08:47:05 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRWV9-0061Ot-87; Wed, 31 Mar 2021 08:47:02 +0000
Received: by mail-oi1-x234.google.com with SMTP id x207so19331968oif.1;
 Wed, 31 Mar 2021 01:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YPc+uTt6u9Gex5uKAuE32MPC9BxOddf+qqv/TJVxnp8=;
 b=CUwpj+RHzyD2ZS7rRO1GNDE2PzqC0d1V+tHz2AvyWOQy38xnJUuF4NrGcsDCn9oHBS
 BdRObVnsilPmfOrvCJQ2BNSrzXPeFqUtR6qq+Cnt8HrpEzmaVUzgKqNZkm3j53CZ4Kgb
 iwHcYPynTD21mNOAd3CaFL618CigQP9mNnOTHnIzzHFOdXPB4WtSRR2g0tQa/InlaXY1
 5rKUmXlfrOb1rRlDDNEe4sVJlFlfdqo3apxjSj8qK/CeEiD2NLFjXVEGHFUllivx8nOb
 NhQAkmf93KyiVXdQZX+nMkHaTQ62RHxW0iB1vxDxdXyPC6gXbklAnxc3IuLTm52Zpig4
 wXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YPc+uTt6u9Gex5uKAuE32MPC9BxOddf+qqv/TJVxnp8=;
 b=TUiR5+ADBLBMYijKzMHqWHWLjTw7SilqO8eEM6ogiCm830zxMfi9nPr9S3p+p9pnk+
 9E8yTQOD85CzJF7g8oRFxRiJEiZwiftDbED8wDcLcfIlweXVllGfJwS8cJGYXH8fGY5m
 c0AkTe9RUo69cImsGTLIV4BKrdSD6qak7T6EbUiqgeFO8q9al6UWDmLJjMSxMPhX8q6D
 dVexFIWLzGiUNUX+foY0AR0+aASQlUh2E6eN4EmSlCqx6/VjGS8NjX7xRwJQmRU25J8q
 ycCYNdYNTuLSEaDaecQKXaFsOz0/rweHR623NXRnBU2GkR5NSfWzGtmrP8yFPJBPHSMF
 6JWQ==
X-Gm-Message-State: AOAM5328Efs1dm77rDns3WbK8MYG8Imigqv+XUzCsUlS7vrNFSPGfo+q
 cmNxnOYHfn3CN0PBS87dL5u3Jipt/jweKh2CFHM=
X-Google-Smtp-Source: ABdhPJy8E/bi6YOlpwoEGw13JyLFarSsEH3/w33uMThsYYS5/eZIlswb2Q9MdFPBxsZf0SYFhBRDo9pCwlukz3ofwpk=
X-Received: by 2002:a05:6808:bd6:: with SMTP id
 o22mr1584465oik.129.1617180415512; 
 Wed, 31 Mar 2021 01:46:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210201121416.1488439-1-Bilal.Wasim@imgtec.com>
 <20210216165926.46bbafc7@a-VirtualBox>
In-Reply-To: <20210216165926.46bbafc7@a-VirtualBox>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Wed, 31 Mar 2021 10:46:44 +0200
Message-ID: <CAFqH_517W+ZOR-vMtZEy9GY9ySD_+Sm-NcgJS2iQAO00J5LWKQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Misc bug fixes in mtk power domain driver
To: Bilal Wasim <bilalwasim676@gmail.com>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_094659_521346_A3F5F0F1 
X-CRM114-Status: GOOD (  19.63  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Bilal,

Thank you for your patch.

Missatge de Bilal Wasim <bilalwasim676@gmail.com> del dia dt., 16 de
febr. 2021 a les 13:00:
>
>
> ping - can this series be merged ?
>

This series breaks my display with the current mainline. With those
patches applied my display doesn't turn on and I get the following
error. Note that in mainline we don't have a gpu working driver.

[   66.979546] ------------[ cut here ]------------
[   66.984234] [CRTC:43:crtc-0] vblank wait timed out
[   66.989070] WARNING: CPU: 2 PID: 432 at
drivers/gpu/drm/drm_atomic_helper.c:1512
drm_atomic_helper_wait_for_vblanks.part.0+0x278/0x2a0
[   67.001166] Modules linked in: af_alg mwifiex_sdio mwifiex
btmrvl_sdio btmrvl bluetooth mtk_vcodec_dec mtk_vcodec_enc cfg80211
uvcvideo mtk
_mdp mtk_vcodec_common v4l2_h264 v4l2_mem2mem videobuf2_dma_contig
videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videobuf2_common
videodev
 smsc ecdh_generic mt8173_rt5650 ecc smsc95xx rfkill mc usbnet
cros_ec_sensors snd_soc_rt5645 cros_ec_sensors_core elants_i2c
mt8173_afe_pcm c
rct10dif_ce elan_i2c industrialio_triggered_buffer sbs_battery
cros_ec_chardev kfifo_buf cros_usbpd_charger cros_usbpd_logger
snd_soc_rl6231 s
nd_soc_mtk_common mtk_vpu display_connector pwm_bl fuse ip_tables x_tables ipv6
[   67.057686] CPU: 2 PID: 432 Comm: gnome-shell Tainted: G        W
      5.12.0-rc5+ #25
[   67.065861] Hardware name: Google Elm (DT)
[   67.069950] pstate: 60000005 (nZCv daif -PAN -UAO -TCO BTYPE=--)
[   67.075952] pc :
drm_atomic_helper_wait_for_vblanks.part.0+0x278/0x2a0
[   67.082477] lr :
drm_atomic_helper_wait_for_vblanks.part.0+0x278/0x2a0
[   67.089000] sp : ffff800012c23aa0
[   67.092308] x29: ffff800012c23aa0 x28: 0000000000000004
[   67.097621] x27: 0000000000000000 x26: 0000000000000001
[   67.102933] x25: 0000000000000038 x24: ffff0000c4726000
[   67.108246] x23: 0000000000000001 x22: 0000000000000000
[   67.113558] x21: ffff0000cabbd880 x20: ffff0000c3bd8080
[   67.118869] x19: 0000000000000000 x18: 0000000000000000
[   67.124180] x17: 0000000000000010 x16: 0000000000000000
[   67.129492] x15: 0000000000000030 x14: ffffffffffffffff
[   67.134805] x13: ffff800011ce2680 x12: 00000000000007c2
[   67.140117] x11: 0000000000000296 x10: ffff800011d3a680
[   67.145428] x9 : 00000000fffff000 x8 : ffff800011ce2680
[   67.150741] x7 : ffff800011d3a680 x6 : 0000000000000000
[   67.156052] x5 : 0000000000000000 x4 : ffff0000ff77c918
[   67.161364] x3 : ffff0000ff783878 x2 : 0000000000000000
[   67.166674] x1 : 0000000000000000 x0 : ffff0000cc660000
[   67.171985] Call trace:
[   67.174426]  drm_atomic_helper_wait_for_vblanks.part.0+0x278/0x2a0
[   67.180603]  drm_atomic_helper_commit_tail_rpm+0x80/0xa0
[   67.185913]  commit_tail+0xa0/0x180
[   67.189399]  drm_atomic_helper_commit+0x160/0x370
[   67.194100]  drm_atomic_commit+0x4c/0x60
[   67.198022]  drm_mode_obj_set_property_ioctl+0x164/0x460
[   67.203330]  drm_ioctl_kernel+0xc4/0x11c
[   67.207251]  drm_ioctl+0x210/0x430
[   67.210650]  __arm64_sys_ioctl+0xa8/0xec
...

Thanks,
  Enric

> On Mon,  1 Feb 2021 17:14:13 +0500
> Bilal Wasim <bilalwasim676@gmail.com> wrote:
>
> > Incorrect mask for the "bus_prot_clr" field meant that imgtec
> > gpu power domain (mfg_async) was not powered up correctly, causing
> > failure in driver booting. Fixing this and also adding "domain_suuply"
> > capability to "mfg_async" power domain (for mt8173) as imgtec gpu
> > needs da9211 regulator to be enabled before enabling this subdomain.
> >
> > Tested with mt8173 elm chromebook.
> >
> > Bilal Wasim (3):
> >   soc: mediatek: pm-domains: Use correct mask for bus_prot_clr
> >   soc: mediatek: pm-domains: Add domain_supply cap for mfg_async PD
> >   arm64: dts: mediatek: mt8173: Add domain supply for mfg_async
> >
> >  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 4 ++++
> >  arch/arm64/boot/dts/mediatek/mt8173-evb.dts  | 4 ++++
> >  arch/arm64/boot/dts/mediatek/mt8173.dtsi     | 2 +-
> >  drivers/soc/mediatek/mt8173-pm-domains.h     | 1 +
> >  drivers/soc/mediatek/mtk-pm-domains.h        | 2 +-
> >  5 files changed, 11 insertions(+), 2 deletions(-)
> >
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
