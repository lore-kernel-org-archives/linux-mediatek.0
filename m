Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A64EC64EC4
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 15:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:To:From:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CpL8pfFHgYoyZ2Mo0Ft2NbfXGys8eh5PDeoz/LLjCnE=; b=uiWqBQGUs1nGWGicoadkOXfbM8
	vRpw4sFjBbZwGkuTYKdQzI5GBuPGXGoQreuEZnKRWcuD592V5LpeH+l7W0yLMNiwr68ZWHpfCAusn
	XBL4z9GvrrWXFKd0g4Ehx6CC23oikRcw+jIqnpk2jrEOvDds/ULtPiU/SADK/LHbBsGI/Q8pnbGx9
	HBX2Z9dK/3oyxGJvkkGhqnSRZAGkg7FM2YTQvv2NwbqJA5vdPE7FVQNfY+eu/RfJlmPawAFFUjXk+
	4pO24b37UDChTB2ospAYfNFNlaZd3VaQZ/7kjUS+gZr/fH9i0yZ39/J47kRwgQTWvwcrR1r5qCKMv
	MM+lBE/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZvYR-005fbk-Ko; Wed, 08 Mar 2023 15:18:11 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZvYO-005fYi-Eh
	for linux-mediatek@lists.infradead.org; Wed, 08 Mar 2023 15:18:09 +0000
Received: by mail-wm1-x32a.google.com with SMTP id ay29-20020a05600c1e1d00b003e9f4c2b623so1554182wmb.3
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Mar 2023 07:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678288682;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CpL8pfFHgYoyZ2Mo0Ft2NbfXGys8eh5PDeoz/LLjCnE=;
        b=kNByBMal4zZHXdad7tc2QCDgtp/m9PMhcqp+wlj+KjBJcEHqZ3CJbosiP1vgGMGVkg
         wKx6halLGdnthasuLHK5VS1ho8F38Unxc5Mjhvu0dtq/3/mvDtZp/7VD+uN7oBEup9O2
         7KxewzMnLA0ekqlP+H0qGqJh9y3JqyTBNyxR0VJhf/Hm2mljk4HYI8sU6SkzjcBu7DZf
         8VvOQTtl+y2khF2bpJhO8r/uYWvcPtATqETY4w9KX2Pl5dKDy+qAJeRfNMfK6JVJH38t
         +qbok1LujptLeuXgEC+0A0ljTdHcNNGJhyeOKXtggy/7NxtTEztNAGq8K9p0ZxRq+OJS
         cNwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678288682;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CpL8pfFHgYoyZ2Mo0Ft2NbfXGys8eh5PDeoz/LLjCnE=;
        b=R0dpRQSjipKwQRScZOhoLUdff68DcKNC+FYRfVCJ+rYMDooqfakFATJGDaHlHdevtP
         SyDkKGJvIv0ZN53kxKWytCHL5HBHvWSA387Jyq+8l77y25yDYu7ya05eNqegKIK8Ft3p
         REdOlXhC1Mm2+W+wU0zCfqqYpNZhQtHjvWHNtZfJAM3VYj2nshQSxRufx7xH7FRNdvmR
         6nlUCGlE4PMb0CmmaoK5R/gcqGGb2Vgr8AnW/WmwesTzCgRva1cJp3M2zVrqY5d2j/X4
         mjDYF2bM/QQllouuHF+/v7ICRWA1tPLdqRbK04G+bggOVXQHW4M38RJzhnpttTLRYI47
         QLeg==
X-Gm-Message-State: AO0yUKWg14FsHdddw+oB/9neaXk7st80aUelBNYAoavlWFcSwxTUvR1m
	3bE5petFFnFtdkhLK68A36SrKUuMFu8=
X-Google-Smtp-Source: AK7set/7YcnyKmOCKdg6qoexCcSDKPVPwnSHqx8BMJn8M62bG+pIQvs2hRfutS0vU2rHHdtCQGDTTg==
X-Received: by 2002:a7b:cc10:0:b0:3eb:3104:efef with SMTP id f16-20020a7bcc10000000b003eb3104efefmr16285682wmh.31.1678288681863;
        Wed, 08 Mar 2023 07:18:01 -0800 (PST)
Received: from DESKTOP-8VK398V ([125.62.90.127])
        by smtp.gmail.com with ESMTPSA id e41-20020a05600c4ba900b003e1f2e43a1csm15774119wmp.48.2023.03.08.07.18.00
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Wed, 08 Mar 2023 07:18:01 -0800 (PST)
Message-ID: <6408a729.050a0220.f92fb.0940@mx.google.com>
Date: Wed, 08 Mar 2023 07:18:01 -0800 (PST)
X-Google-Original-Date: 8 Mar 2023 20:18:01 +0500
MIME-Version: 1.0
From: terenceblake6795@gmail.com
To: linux-mediatek@lists.infradead.org
Subject: Bid Estimate
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_071808_501316_96C210FD 
X-CRM114-Status: UNSURE (   2.06  )
X-CRM114-Notice: Please train this message.
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

Hello,=0D=0A=0D=0AWe provide accurate material take-offs and cost=
 estimates at low cost and with fast turnaround. Our team of prof=
essionals has been providing these services to General Contractor=
s, Subs (Painting, Electrical, Plumbing, Roofing, Drywall, Tile a=
nd Framing etc.). We offer both Residential and Commercial Estima=
tes and we cover every trade that you wish to bid, whether you wo=
rk with CSI Divisions or your unique classification. We use the l=
atest estimating software backed up by professionals with over a =
decade of experience.=0D=0A=0D=0AWe are giving almost 25% Discoun=
t on the first estimate.=0D=0A=0D=0APlease send us the plans or l=
inks to any FTP site so that we can review the plans and submit y=
ou a very economical quote.=0D=0A=0D=0ABest Regards.=0D=0ATerence=
 Blake=0D=0AMarketing Manager=0D=0ACrown Estimation, LLC=0D=0A


