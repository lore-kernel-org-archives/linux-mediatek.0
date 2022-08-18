Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB618C25B08
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Aug 2022 00:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6CaxtAYiTS0Q/JbqlLjhs4hB/carPEU9EwHyTaT0VSc=; b=4VXWhjvbB4+Zf1KRiDbBGs810v
	Cb02koZFsjg+AlgzMyvEPOE9gWJqRZamywl2brh+P/0DNjEw7SynnQxyIP7iPciQLZoopE1fY31Mg
	W3FIH6PbSBndjgvFoMvmjt3WjU/j9kFpkiIXxiiWxI3f0m01HvZHJpvZxuhNmqlCuvvXdy9PdR5k+
	MX2S4iqU0k63CTJmqVtfxpNNzF53dl+XlAsPeocRFHB43tF0JQhJOwa1YvdEIc1sjYhsWU1+4G4Rr
	tOuJJJj9x+Dq1CcyB0z5BPYgD0hbmcLR1c/vlhUpt/qn0iktsq+Ce6TXO+JavHVpWj0yq6rWCiXlS
	CPla3NXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOTeC-009Toi-5s; Thu, 18 Aug 2022 00:44:32 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOTe9-009Tkk-8b
	for linux-mediatek@lists.infradead.org; Thu, 18 Aug 2022 00:44:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B1E91B82000
	for <linux-mediatek@lists.infradead.org>; Thu, 18 Aug 2022 00:44:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 326BBC43145
	for <linux-mediatek@lists.infradead.org>; Thu, 18 Aug 2022 00:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660783466;
	bh=3kIk1qrELETqqdtSh1vAVI42Nm+C7jEY8yunalwBG98=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AI03jv2ri6hi2nxdPQ3B/awPYiJst62jfo0KJznajtFATfQ+Fw/GcU6NVUgNWyTeS
	 YgB3KeB7jrNR6aNzL5+2IIQzL9J1zp1k7Ih+sVgi219vBlM/wGBn2MDXcMTK+7PUmv
	 Lzhf/TIh8OlgxBp9VQgSKJIWWUgXHbuT62i+4z9v7meG/223rlOZs/2EvG5UvRRxSe
	 LGzNEOnfqA6bqXgKk84jbpxM2xAYp1z/Uh8EFYXO6CVqfngKWDxcwt88ZrBPNgUDvb
	 vT/oxa2RbBRdqKxLNKB8mvOsyxnnJnd+Vq6hj5OvlpNXdLrx4HtVjL+C/loVeTAZQR
	 s5sNmJr+dlRuw==
Received: by mail-wm1-f47.google.com with SMTP id j26so128077wms.0
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Aug 2022 17:44:26 -0700 (PDT)
X-Gm-Message-State: ACgBeo3Sqtj1bPoOZbNLrhRCVRrO71hydpXZ55W4fqzNANXWh2y1a99K
	CjuWfDtLgOc80qlmIRtcEGgz65JQ224vR008vyQ=
X-Google-Smtp-Source: AA6agR4AdYpfuOh6x5teVCDNh6jxcqpeUvAMgqc+Wpi81TJk0UX6wtq5nPxzYV9jMHWrD2S7+mcaRBzbdnDeA3L7p+w=
X-Received: by 2002:a05:600c:5008:b0:3a6:1cd8:570d with SMTP id
 n8-20020a05600c500800b003a61cd8570dmr281830wmr.57.1660783464388; Wed, 17 Aug
 2022 17:44:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1660606893.git.objelf@gmail.com> <44acac2a0c1ce4a5d554a24227f80c6ccb3af878.1660606893.git.objelf@gmail.com>
 <YvyV3EBXL1TBQrc0@lore-desk>
In-Reply-To: <YvyV3EBXL1TBQrc0@lore-desk>
From: Sean Wang <sean.wang@kernel.org>
Date: Wed, 17 Aug 2022 17:44:12 -0700
X-Gmail-Original-Message-ID: <CAGp9LzoM6wMiQ2g3r8G-JaZS-Y=_91edM2FVbAmHZPC4d8nyQQ@mail.gmail.com>
Message-ID: <CAGp9LzoM6wMiQ2g3r8G-JaZS-Y=_91edM2FVbAmHZPC4d8nyQQ@mail.gmail.com>
Subject: Re: [PATCH 6/9] wifi: mt76: mt7921: drop ieee80211_[start,
 stop]_queues in driver
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: =?UTF-8?B?U2VhbiBXYW5nICjnjovlv5fkupgp?= <sean.wang@mediatek.com>, 
	Felix Fietkau <nbd@nbd.name>, lorenzo.bianconi@redhat.com, Soul.Huang@mediatek.com, 
	YN.Chen@mediatek.com, Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com, 
	Deren Wu <Deren.Wu@mediatek.com>, km.lin@mediatek.com, jenhao.yang@mediatek.com, 
	robin.chiu@mediatek.com, Eddie.Chen@mediatek.com, ch.yeh@mediatek.com, 
	posh.sun@mediatek.com, ted.huang@mediatek.com, Stella.Chang@mediatek.com, 
	Tom.Chou@mediatek.com, steve.lee@mediatek.com, jsiuda@google.com, 
	frankgor@google.com, kuabhs@google.com, druth@google.com, 
	abhishekpandit@google.com, shawnku@google.com, linux-wireless@vger.kernel.org, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_174429_471579_D4F772E7 
X-CRM114-Status: GOOD (  11.01  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

HI Lorenzo,

<snip>
> > +
> > +     dev_dbg(dev->mt76.dev, "BSS %d is %s\n", event->bss_idx,
> > +             event->is_absent ? "Absent" : "Present");
>
> do we really need this? I guess we can just drop mt7921_mcu_bss_event entirely

That is not really necessary. That was just what I used to diagnose
firmware behavior. I think I will remove it in the next version.

     Sean
>
> Regards,
> Lorenzo
>
> >  }
> >
> >  static void
> > --
> > 2.25.1
> >

