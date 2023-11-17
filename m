Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DE7C54FB9
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Nov 2023 05:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6+5OfOb2sZO7MAbLVWKJTky5HfBI5gwmrmh4yrNi8bE=; b=1JJkvdPmm+ElEECvBSR3bPnL0u
	vS6SVbi5JcNFViNBJJxwSloCl/3Ii3vsmVyYxGED7r1w6S6FfeAPfzU3aL7uudoMkSjIwX9IiP24x
	dtmIQwca+Fv3WyxyFJ/Uj7e4HIqHJazERunuIf7TZfhq43YNlP30cfqQYkvo8fXDsoQT/PhOBDfnY
	eTDvZLyrIUSmL57LqtC6mSP32U5M8yDptWaOQpDewRqatfj36jbnXK23UlgldDwSECZLxbLVfMUmA
	ZaNXTU9UblCJ1CfC5cYtHMuX5qKzgBYX+721G5yZVH/rLrPIhGWsQeyH8IbdTa18FtiO3f2J8Vf4B
	1XZQ4+AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3rRJ-005g6v-13;
	Fri, 17 Nov 2023 05:30:49 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3rRG-005g5W-2r
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Nov 2023 05:30:48 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2c79d8b67f3so20605811fa.0
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Nov 2023 21:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700199045; x=1700803845; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6+5OfOb2sZO7MAbLVWKJTky5HfBI5gwmrmh4yrNi8bE=;
        b=TMM49TjPOyByNtOeD33INKu9vbG+swOKFDuiU7YrEQx0QvTVLnCRknN0juLPTP3++Q
         JRhPJVHjakSkNY5Rh5b361cHyar1GppDSD9Ukp8z203ap1oYGOQzyR5LxzInKmHLTDl0
         6++jFQDFNFALTO2c4jiGSjoAXk26PY0jq6euK/BWuFEv1p9nwfbwxR049Rl9pJnbwopv
         078d+5rwK5EtWKKX1TZWRClkYhhqLY2ie/WXcmYWnwjhsSKNk4sjvzMD96kx+QqPlXQm
         ii9u0IEULfeYVzzyBQhpxGT+3RggWf/0v22NYUUqkWqll05o4HMImBvb9zWgyr1XwSvt
         Lfcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700199045; x=1700803845;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6+5OfOb2sZO7MAbLVWKJTky5HfBI5gwmrmh4yrNi8bE=;
        b=YUojop7DTVbFf5xz6MwylJJck70xOZpfu425Wp5ARPlKhUHlKJFXQHmjM7UHC5ya2R
         zTwoapC/Djty1ddKmHXcxWZVOlhSDfuuNh4WQkA/LGBqL8vzABbPFcH1xEYULoaVBYHJ
         z1LHh24LLremRCgWTxFZwyOFr08rwI8KCbI1qf9h7Y59WyNFYcLjVM1nI6TzjsE5eCjP
         V5o5QaoEP7ifFy6SFNe1KdhC4SQSp5owN1gLVPIfva/iv4wv24y6R5+Yb9j3mAk1pGJ7
         eZ9DTeTLGz8hPvA3oWbdSdlIlfD4KLPfscGOKE/+uj922Du+TN9kbLREUo2NJw/mhKaW
         oabg==
X-Gm-Message-State: AOJu0YzJBiU2u3W1zW1rSKSmstpIRxenIYPbYE5PpsGYUB7Ful4V5IxD
	gxkMaaHhVK8TIJUdRv26jLNVBPO7dfXmc9663d0=
X-Google-Smtp-Source: AGHT+IFkqKplUEU97iUGS1k/jBNokuHKyp3swU6pHYOmFPf12NGCOQ/6JotOz8HTpkiR8bJHkmUX9TlxFfLQslWUNNs=
X-Received: by 2002:a2e:3208:0:b0:2c6:f6eb:b396 with SMTP id
 y8-20020a2e3208000000b002c6f6ebb396mr8092700ljy.40.1700199044527; Thu, 16 Nov
 2023 21:30:44 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Fri, 17 Nov 2023 06:30:32 +0100
Message-ID: <CACna6rwZ8q1Zoz4UAryipsZ90yVD86BrcTNv1yKyS8F4DXsuSQ@mail.gmail.com>
Subject: mt76 DT binding: undocumented interrupts
To: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Peter Chiu <chui-hao.chiu@mediatek.com>, 
	Sam Shih <sam.shih@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, 
	Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_213046_948582_9EFA58AB 
X-CRM114-Status: UNSURE (   4.63  )
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

Hi,

I noticed that Wi-Fi on mt7986 has 4 interrupts instead of 1. See:
arch/arm64/boot/dts/mediatek/mt7986a.dtsi
300218b0503d ("arm64: dts: mt7986: add built-in Wi-Fi device nodes")

Those interrupts seem unused by Linux's mt76 driver and are
undocumented in mediatek,mt76.yaml.

Can someone explain what those interrupts are, or just send DT binding
update patch, please? I'd like to get DTS matching DT binding and
passing dtbs_check validation.

--=20
Rafa=C5=82

