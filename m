Return-Path: <SRS0=+xT1=ZE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B266C43331
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Nov 2019 07:09:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 600312067B
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Nov 2019 07:09:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q7XKT5pJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EsEiW+5k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 600312067B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QvBtxrvt7v2dm7bwFBgMLkjrl/Qo+amJXRug0PDHKdU=; b=q7XKT5pJRRjMK3
	SvXkerz6UuwMtfliOl7I4LJCOLrsdRubGJtPt0KiZyD16ZM5Gfpf78o/ov77qhvqp0jWzJLr6/3+n
	I5lFIvbjxoTr9xN2YYLaS4/jd0Mc3jKyh3GPB3tS3M41qoKQD0ZgtegRTHaPKugAwkxAs85S1kRJV
	GN3a12hUTfnNCgZsUpRd8jwc5XMt+astBYmmLq1E8FMGWkgpQXiyYysaRYmGt6awqmt8qVrG0EHyR
	QUx3ltf7Ni2cU2Xck1abIWDOXtbc9SgPZ+wkRn2CSeQnFrTn109Bg905oh4f+MGwc83rAds9coeXH
	vYbjZiqYbdMA07LaC9Eg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUQIF-0005Mr-D6; Tue, 12 Nov 2019 07:08:51 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUQIC-0005Ke-IE
 for linux-mediatek@lists.infradead.org; Tue, 12 Nov 2019 07:08:49 +0000
Received: by mail-pf1-x442.google.com with SMTP id p24so12697570pfn.4
 for <linux-mediatek@lists.infradead.org>; Mon, 11 Nov 2019 23:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=zK78FnAOmv3761AstDJXelt5t5xR2XRW77fvH5frBqE=;
 b=EsEiW+5kyUCExkdffD7tH/HTw0VFRrIgj4HiXF8XKU+s8+YxXn15j5ZruCiQly6Mdb
 q7GX8wD3efvZPwCoSj7sgXxq6EuWXVchXS2z7IqZ6Qo1NVyCKPGhME4O6BACvUwJRwkm
 2N9+FGswolsCy1Dl5C1Xua2F9aQHKDYZEPwPr02tW8pUuelj9NQNUcZPBdofEnH1/bTo
 t/3DrJ3shlpgHJGaMlcvL9OzVafIt6V5fKWM/ObUzBh08LU/lTr5ciKtaj0wtFx0hyhz
 OvdFweNPtGmC0DTkjjKIXg3EFo4gDiMVrNmpQDThE8CG1+yZBKI7nLU7tAdZVnqhxFED
 FQCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zK78FnAOmv3761AstDJXelt5t5xR2XRW77fvH5frBqE=;
 b=Lljo0kwfo2cKf3I5Hn29I6bbWYZ/F4akzcV4u93T5FqDrLdur9aXRiDEx9Uczk8C+r
 D6bAYnVs5aWsAtV/inqKQxS5Yk0/okRDXesGkb40z/ZCWlIdo+mjGVpTFmXggIcolnDT
 RSHiBDweQYqBq3Qc/lhma0YeJQdU6Zydw+gV3E+tf5ApcJzYkCx3BjUXfILTusM5+dpL
 i5MzIRwsqo2nPb80eu/noHG0DGOq1x03xho/KBwgygGBiWITSAhzt24MRcJuepVfg+10
 KsSw8tPrjNnmHpPfjxu5C/2CkSfD0FYpIFJsOndKygNMRUqRKLv7oTJExcPV27V7j2Sh
 EaIA==
X-Gm-Message-State: APjAAAUWq5hHh4SN13fVo5cMy1Vh+hDrDmBmpRUp9HIreHSF6BSBRW/Z
 /+Beev31N+vHxSuo2LidRSWixA==
X-Google-Smtp-Source: APXvYqwE4C2wT2seRucgaO6gP6vKq4NKee7ygjFHmTDw+i/soL0w6a48b/EcGkDtS6QcPMZ7gFUutg==
X-Received: by 2002:a63:a05c:: with SMTP id u28mr35047901pgn.333.1573542527714; 
 Mon, 11 Nov 2019 23:08:47 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id o1sm15092669pgm.1.2019.11.11.23.08.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 23:08:47 -0800 (PST)
Date: Mon, 11 Nov 2019 23:08:45 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Pi-Hsun Shih <pihsun@chromium.org>
Subject: Re: [PATCH v20 3/4] rpmsg: add rpmsg support for mt8183 SCP.
Message-ID: <20191112070845.GR3108315@builder>
References: <20191014075812.181942-1-pihsun@chromium.org>
 <20191014075812.181942-4-pihsun@chromium.org>
 <20191111231023.GD3108315@builder>
 <CANdKZ0frU9+dRYeMaJjjKm6emxj41c_jBk_RX3G7bXn_oXKp4g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANdKZ0frU9+dRYeMaJjjKm6emxj41c_jBk_RX3G7bXn_oXKp4g@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_230848_633277_BA769FA7 
X-CRM114-Status: GOOD (  12.14  )
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
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon 11 Nov 22:42 PST 2019, Pi-Hsun Shih wrote:
> On Tue, Nov 12, 2019 at 7:10 AM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> > On Mon 14 Oct 00:58 PDT 2019, Pi-Hsun Shih wrote:
> > > diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
[..]
> > > +static struct mtk_rpmsg_info mtk_scp_rpmsg_info = {
> > > +     .send_ipi = scp_ipi_send,
> > > +     .register_ipi = scp_ipi_register,
> > > +     .unregister_ipi = scp_ipi_unregister,
> >
> > These are exported symbols, so unless you see a need to support
> > alternative implementations in the near future just skip the function
> > pointers and call them directly.
> >
> 
> Yes there is request from MTK that they do want to reuse the mtk_rpmsg
> driver for things other than mtk_scp, so there's a need to support
> alternative implementations for this.
> 

Fair enough, let's leave it like this for now!

Looking forward to the next revision of the patches.

Regards,
Bjorn

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
