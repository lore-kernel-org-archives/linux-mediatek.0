Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB11C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 14:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YDxqWEg7EmzP7uNyet2C2UZ9qYQKD/iRbvjSirUCd1Q=; b=UOiOC6jnFcQUi2JqAIcvUHG9oE
	kliHCQe/4CPN3peAQaIt11+sjAv1tayZ0fP5y7fvF0u4rkX4cBL2Z75AFXe08FjFm8FGN28rwbp9F
	PQBp7H3NXby5eP79iGhwNMPVo2SZQ7foXPK3IV+QvKDKdoIVGX/8K+ldZ75iv5QFa2QnmLSLhF58t
	23F5pZiXZaHXHvUJLaKZaWEgan0etz2vXxnRQ+ZEzgoY26ToR3nvhppKV42QQQVGNF0IjITEtN0gu
	VdlEjIJ5G+y4YE9/0kaaH6XgrqmIwn5kCoE2rqDmgzOrLln8Fvd+QkOMw5IRMNTGLqvrmH/zlGDrY
	ysbbdFaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osQ3G-006ASU-P2; Tue, 08 Nov 2022 14:58:10 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osQ34-006AMn-9G; Tue, 08 Nov 2022 14:57:59 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout3.routing.net (Postfix) with ESMTP id 2FDC360F5F;
	Tue,  8 Nov 2022 14:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1667919466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YDxqWEg7EmzP7uNyet2C2UZ9qYQKD/iRbvjSirUCd1Q=;
	b=nYSOFqU9AwgKTT5oailgdjYOXNHtBMEGXmRP5tnJ8SSyxoE4TofkAu8NQlJibfAmc/bMSM
	Ct8eJL02jjHHmH8FMG9FQ5KS9ESmk19lcNhXo4PqusIAJf5e275+sOMmVWbhGXBfg18cgj
	dFARsxZzyG2a2Khp29L3dDPoDkUC39o=
Received: from [IPv6:::1] (unknown [IPv6:2a01:598:a083:6a1c:1:2:c9fa:536d])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 0CDFC3603CF;
	Tue,  8 Nov 2022 14:57:44 +0000 (UTC)
Date: Tue, 08 Nov 2022 15:57:40 +0100
From: Frank Wunderlich <linux@fw-web.de>
To: Linus Walleij <linus.walleij@linaro.org>,
 Frank Wunderlich <frank-w@public-files.de>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-mediatek@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_Re=3A_=5BPATCH_v2=5D_dt-bindings=3A_pinctrl=3A?= =?US-ASCII?Q?_update_uart/mmc_bindings_for_MT7986_SoC?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CACRpkdZFkeX7J9R2C0rhF+WZJXe65y6FfeBEMBGGkSTh4AWmsQ@mail.gmail.com>
References: <20221025070255.14407-1-linux@fw-web.de> <e7192d9b-df86-a860-d5cb-8b4b9184e5bc@linaro.org> <trinity-889b4468-8a50-4eae-80a1-6bd9ffbeaaf2-1667577856206@3c-app-gmx-bs24> <CACRpkdZFkeX7J9R2C0rhF+WZJXe65y6FfeBEMBGGkSTh4AWmsQ@mail.gmail.com>
Message-ID: <835560A3-5FFE-40A8-84F6-6FE03091A89D@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mail-ID: 780f83ac-7c36-4eef-8b9d-c735a36ce353
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_065758_515679_3B8D8516 
X-CRM114-Status: UNSURE (   5.34  )
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

Am 8=2E November 2022 15:50:44 MEZ schrieb Linus Walleij <linus=2Ewalleij@l=
inaro=2Eorg>:
>Squash and send av v3 if you haven't already! Easiest for me=2E
>
>Yours,
>Linus Walleij

Have already here:

https://patchwork=2Ekernel=2Eorg/project/linux-mediatek/patch/202211060801=
14=2E7426-3-linux@fw-web=2Ede/

regards Frank

