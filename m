Return-Path: <SRS0=/klC=A3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDFD9C433E3
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2020 14:44:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89A3E207E8
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2020 14:44:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ezl9tKXE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="XMsQMRWb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89A3E207E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XOa5honnt3qqjbVSQaQsamW9vxWrtUwBRUhFXpiZLBU=; b=ezl9tKXEwde8QeK6mF430ZaKO
	ugQUe06OJiEbWhcfz2TFPBf2TCh2lsrad20QKcc0nwDEbTrY/h02Ib4HdMbO7/0AeBwBz/tYN+s3D
	dwvbPINutdpINgyf5ZU8AyMOkhDFZCz8I08zMqho/7ZYXZp/Nl/K3rT6WdDg9Nwf4a1cEsCyRnSSD
	OpIvDGTlI3W8faSqvg0wH73YSiWW/k+0V8dVE1/Y6gm3vMPtamYYlxgfUb2TLSDsotY9x5rYQ6hyr
	tISbuL0Kq/vT7GC0rsWOa/mSP7THic1EVDALeLtTSalit2u2PAqy8Vk0Q97edWx4DPiJHS7eNjNqi
	DdzDDwvog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jw57P-0001mP-2c; Thu, 16 Jul 2020 14:44:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jw57N-0001lg-0S
 for linux-mediatek@lists.infradead.org; Thu, 16 Jul 2020 14:44:13 +0000
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C5F3620849
 for <linux-mediatek@lists.infradead.org>; Thu, 16 Jul 2020 14:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594910651;
 bh=jEJTiHoFVYkD0JQnDpdy9N0U1kE0CdBaGEzuIUBvmWc=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=XMsQMRWbvgKA0ghNMj54ePCMcu51CjrOvOhgBBIbWbK+UPyZpA+kSRQiCkqnU8oB1
 xheGwsUAZQLhzKmf+SyyNOqQPZpn73/hE/Gasefd9jmiGIfWBF1v4LHg0lHLvDPHmn
 myR6/f5G4nwaTkfurP3soHu51p/p2puBHsIX0Vjk=
Received: by mail-io1-f53.google.com with SMTP id i4so6231907iov.11
 for <linux-mediatek@lists.infradead.org>; Thu, 16 Jul 2020 07:44:11 -0700 (PDT)
X-Gm-Message-State: AOAM532bwipaLI4ybOp0tk1UYyMFEutuWQMA5KEm2ZHyoG7Lov26uUGr
 jOBBW/M1yc8sr4meulZRkaG6JV5EL36sKZkqNJs=
X-Google-Smtp-Source: ABdhPJzfbB/6Ox7V5UJgWHrAwQ/fTy2KkkD0iT058tfJVF31BPUz+BpvdAOAZcvNW4qC9RTJBEeFwfD9k3tLqo185BI=
X-Received: by 2002:a6b:c910:: with SMTP id z16mr4745171iof.120.1594910651194; 
 Thu, 16 Jul 2020 07:44:11 -0700 (PDT)
MIME-Version: 1.0
References: <cfee5e2b0064b8aa387e13901913a3a424dc1eec.1594624155.git.ryder.lee@mediatek.com>
In-Reply-To: <cfee5e2b0064b8aa387e13901913a3a424dc1eec.1594624155.git.ryder.lee@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 16 Jul 2020 10:44:00 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7AiTau50zWyiGVjijQ96WX4Z_PVHGExgyt0thWvWztMA@mail.gmail.com>
Message-ID: <CA+5PVA7AiTau50zWyiGVjijQ96WX4Z_PVHGExgyt0thWvWztMA@mail.gmail.com>
Subject: Re: [PATCH] linux-firmware: mediatek: update firmware v2 for MT7615E
To: Ryder Lee <ryder.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_104413_160947_893E1B85 
X-CRM114-Status: GOOD (  16.93  )
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
List-Id: <linux-firmware.lore.kernel.org>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 Linux Firmware <linux-firmware@kernel.org>, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Applied and pushed out.

josh

On Wed, Jul 15, 2020 at 9:15 PM Ryder Lee <ryder.lee@mediatek.com> wrote:
>
> From: Shayne Chen <shayne.chen@mediatek.com>
>
> Update to 20200629111339 version to aligh SDK. Mainly fix DFS false alarm.
>
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  WHENCE                 |   2 +-
>  mediatek/mt7615_n9.bin | Bin 457992 -> 457992 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/WHENCE b/WHENCE
> index 086374d..40256bb 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -4643,7 +4643,7 @@ Licence: Redistributable. See LICENCE.mediatek for details.
>  Driver: mt7615e - MediaTek MT7615e Wireless MACs
>
>  File: mediatek/mt7615_n9.bin
> -Version: 20200131
> +Version: 20200629
>  File: mediatek/mt7615_cr4.bin
>  Version: 20190114
>  File: mediatek/mt7615_rom_patch.bin
> diff --git a/mediatek/mt7615_n9.bin b/mediatek/mt7615_n9.bin
> index f6ad748155672dd52fd7f41c452c320ad8ef8d7d..761ad9bbc8714eca880cb7fd24a3c0ea761bf839 100644
> GIT binary patch
> delta 51
> zcmeD9CEf8$x}k-!g{g(Pg{6gc3){6noMuLrhK7d5#+K9X|6!BngL4`7>|tO40Onp0
> AvH$=8
>
> delta 51
> ycmeD9CEf8$x}k-!g{g(Pg{6gc3){6noQB4Rh893*H2wY`HfcUMmtoHy1_l7-5fGpN
>
> --
> 2.17.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
