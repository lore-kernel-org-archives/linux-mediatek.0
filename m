Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72078C61DD6
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2026 16:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qd8FjjdakEvlndPpogmSOky/bdaCcagMgEJZOrnyBdY=; b=cpMwZjcJagjEdhMd23EAkuw4tM
	M3DTmy50keVZOaIBHwu7PK3CMKmVKcAude4puQkIiimVVQ88D9eEnsXeYWb1QmDIPz2GvCLxtmBZC
	2HmEEAnMboIbmRiLmm1CXxNuSoVpPkDPDrJt4LSbnNL9ke6EvanNidcBmeuTdEpJX9VzdcWeCtkLH
	AutdAqWpIF3KO39xEZMZb7Rpb5jb+Zv+zP6zkuiriuqvI2TkfG1xwWSSK/gY3XDBBAlQnIZ3prYxn
	2opl3xeLtWX6OFyOrJmDuUYH+U4hRyqUcMI2G70x7H8zrEtsOB3gva/ZnikZlaU9EGxF2+1ct5gOm
	+7rD6aDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1R4H-0000000Cctr-0zkR;
	Tue, 01 Sep 2026 16:10:37 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1R4D-0000000Cct8-3u8D
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Sep 2026 16:10:36 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-90e8372bba7so344986d6.0
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Sep 2026 09:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788279032; x=1788883832; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qd8FjjdakEvlndPpogmSOky/bdaCcagMgEJZOrnyBdY=;
        b=fLKEH+haAYodIC+zpJ8b106hRBpILGH2qqk52aOQnLgGisIrPy/1m2Qg+vhgk+gULU
         DvNai6QU8YkuEDl/l6rwSJwtVuFV9uIC6Vaypo2Gee+FRuY1q6e+Q2lUZGkF6MB18mYi
         MDxpifskBr5itLZTtTeukw87a6EkwqztBBM7Ic4xFX1LRSj5KAALoPdDj6Kle86s4JW3
         DCRWlbwvCnTLyjUtnp8E38RXmRpjEqCdOy0SD8tvKusuYfr05wyaQBgFoQxxXx4NcLqi
         JniMmo7+X6F4L96Jagw6Dq/xFuXMndKklCEBwfpQm91l4TRU2wJFBc2eBLOKaa6A73O3
         KeNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788279032; x=1788883832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qd8FjjdakEvlndPpogmSOky/bdaCcagMgEJZOrnyBdY=;
        b=SYalib0Mh49pQms+C+QD7u5U84+/R1GepVrDRavTuZ98d45bVoxRXaAE49BD0mZl8W
         fcAW/wsMxp8JaSRvdyOZYwpN8gtR7G6g7OUn8wa21pAyylMcis2c+Q+y2MvCXfFXkh/1
         KRgM9teDaNexsflFawWC+rLVuq76UMFCpEB/r4uT+3gbD82Bv0BLhQ/lKjAp5lzqZI3y
         0m32y8thrsXMcpexr2LF0mJ+2d99W0JTxUBkplFQZiAzmL+CZ/3KLR4co6Y1Dt8jTekP
         2mWzbHSP6W7T7avJdFCD+0MgUyGSu7suEwEPz5mvQrj7HveK5tzoLcqZoTauvgsKVcRv
         tbcw==
X-Forwarded-Encrypted: i=1; AHgh+Ro29dwBaNlbfXNsTOzTJpNCwtiuwgbRfhEUrPknlc9CcihA8Y4j+7YiuLhLROCZJsYxW7r2Uqj2F1sca8ezGw==@lists.infradead.org
X-Gm-Message-State: AFuF++m88n0N/L3bxpzo4JqEk21fstR0/h8I42sBOQvH6kNxVRpgHh/+
	A06Vh90OqmlsnMMT/tT4IZI7uNZQO30AGjcg93ydzyViRmiWZFKLkcKF
X-Gm-Gg: AYBFou28teyj2nGGVFUddVnS3c2D05v3llRsym2H98CUeqjHjz/VkfNjjY2dq7t0DPA
	xInnbFiHBXmkORrehQti9pEUWQ+2Yn+vIYS8oLdcbW5MTPT+vVdWrV9gGFB8enlH9AZOLrHj83x
	JP56qxeFTdhCqpj0SBFkpZcjH4/a51ttOZFSNkbQhf4blQJiY+vZMqnyIyb7InHFBsI1Pc2xtIX
	PNmoarLKPyoY04Z12R5IrOMsaZz9NlOYT0VYd8FMytZOk7djv1+2T3gNrff+HiD3j3OYIXR6gcW
	DBziQyE2N/xyxZXDMSGyJeDLhqOJ178onCG9BA7uRAtKWX7wZ2dPnp1YwWBrrdQaRuiGczZx+Qb
	3Xejk/GhEgbr9hOiFQjuJOvEnsdWn/fxJEoO4oS6PlFVHKyeyb3b18WLgViGO1uNhc0OehKUXOD
	QqZZN3l4Au10nFSrLUEhOb2ZWY5tIJepsJvcKakT65mzGwp729ePaXzfQVnpv1ToS0BEBcmsPbY
	2yJPpJ9qCck2+oIRw3q3ImN3K4PBcQhxgE=
X-Received: by 2002:a05:6214:2425:b0:90e:95c1:47d3 with SMTP id 6a1803df08f44-90e95c14964mr82027126d6.8.1788279031820;
        Tue, 01 Sep 2026 09:10:31 -0700 (PDT)
Received: from Valhalla.lan (50-36-57-116.bng01.ssvl.sc.frontiernet.net. [50.36.57.116])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90d98d54cfasm92683046d6.40.2026.09.01.09.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 09:10:31 -0700 (PDT)
From: Hans Buchheim <hbuchheim@gmail.com>
To: Eason Lai <eason.lai@mediatek.com>,
	linux-wireless@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-mediatek@lists.infradead.org,
	kun.wu@mediatek.com,
	deren.wu@mediatek.com,
	Sean Wang <sean.wang@mediatek.com>,
	quan.zhou@mediatek.com,
	Ryder Lee <ryder.lee@mediatek.com>,
	leon.yen@mediatek.com,
	litien.chang@mediatek.com,
	jb.tsai@mediatek.com,
	Devin Wittmayer <lucid_duck@justthetip.ca>,
	stable@vger.kernel.org
Subject: Re: [PATCH v4 2/2] wifi: mt76: fix memory leak in USB TX path
Date: Tue,  1 Sep 2026 12:10:15 -0400
Message-ID: <20260901161015.607195-1-hbuchheim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827083526.1621600-3-eason.lai@mediatek.com>
References: <20260827083526.1621600-3-eason.lai@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_091033_997159_0A062DB1 
X-CRM114-Status: GOOD (  10.03  )
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

I tested this series on another mt7921u USB device and confirmed that it fixes the zero-length WNM-frame skb/socket-charge leak.

Hardware and software:

  x86_64
  Netgear USB 0846:9065, mt7921u
  Linux 7.1.9-arch1-2
  wpa_supplicant 2.12
  NetworkManager 1.58.1
  firmware HW/SW 0x8a108a10, WM build 20260224110949

I applied both v4 changes without semantic modification to the exact Linux 7.1.9 source and built the mt76 module set against matching Arch headers.

The reproducer used a nonblocking AF_PACKET/SOCK_DGRAM ETH_P_IP socket to send zero-byte payloads to the associated AP and sampled SIOCOUTQ after each send. This produces the same packet shape as wpa_supplicant's synthetic WNM keep-alive without using the supplicant's socket.

With the stock modules, eight sends returned success and SIOCOUTQ increased monotonically by 960 bytes per frame:

  960, 1920, 2880, 3840, 4800, 5760, 6720, 7680

With v4 applied, 500 identical frames paced 10 ms apart completed with SIOCOUTQ=0 on all 500 samples. Both the immediate and settled final values were zero. An additional unpaced burst created a temporary backlog that drained completely to zero in 1.35 seconds.

The link remained healthy after the test: 0% gateway and Internet packet loss, and no mt76 pending-TX timeout, firmware reset, warning, or error in the kernel log.

The reproducer and this report were prepared with assistance from OpenAI Codex using GPT-5.6 Sol at x-high reasoning effort. I reviewed the procedure and results and ran the tests on the hardware described above.

Tested-by: Hans Buchheim <hbuchheim@gmail.com>

