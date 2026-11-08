Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A644606A337
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Nov 2026 19:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ChYY5o4E;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qqhk2HeD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Content-Transfer-Encoding:Mime-Version:From:Subject:Cc:To:Message-Id:Date:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9TFlHze0xZHVHECFNAToGkMpUA7NwrSzUebXukclDxc=; b=ChYY5o4EynYw+L
	QagfVBIEKUK7h3B8yx+i4F8t64ZPezL9xFjqiE3Hp8Ic774zCPKzc7exgewDCooq/v/vsYyuC6tT8
	gj7XojOXuOQRwWMJ4TJY/SVyx8SZJI5QFl2xkImADevG1WIdd6nH8oU69ZaeIvsthraVVQxcLTVth
	KTllPs/gydzVu2mnRboR4ykur5w9aSFjIXrET0IDuLYl+6fty68luGSmCrbdJi/bd29kSt74jYYc1
	uiEXTzPeJwiIIyxqcpRLVEJDbnSQJ/jXrOyt/z3y94k18NOkSJWhZw9L4Wde93LoXtaprsQ43Ihxv
	nBXL8yXvmj5tEMPMA6Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ8WW-0000000GWdt-3ixq;
	Sun, 08 Nov 2026 19:25:52 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ8WS-0000000GWbk-0j8I
	for linux-mediatek@lists.infradead.org;
	Sun, 08 Nov 2026 19:25:51 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c4d7d591607so34103766b.2
        for <linux-mediatek@lists.infradead.org>; Sun, 08 Nov 2026 11:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794165946; x=1794770746; darn=lists.infradead.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9TFlHze0xZHVHECFNAToGkMpUA7NwrSzUebXukclDxc=;
        b=qqhk2HeDze7Idksk5Vcwk9YyV0OhZE4HRvs1nEWeRzoZwWhHKp7MWyr0CmQdfocdUQ
         Re2G4e+61zHHJTFAJvpmDKA5Li/X5k0vH/RIHL8v/C23W7nRZePtvOjLiBtGPWmiyVEX
         AXbp5TP4FqmwbImAdwY3QmciRMTnFRztZoVKXg4dklxgOO0rvDgHYZw48cvx9armdwQ4
         wDjlYVhI/7rF0N7EQsXACaACNaj2Jxyv7B4bP2odZIYmmu2Ht5WWp0rgkVI0pQjY34we
         xX/Q8bqcNkKO9RmZmDfOyoyz4FHRRVfO+VGASKGABUNAmbx/6iJ7+1kyTXDG0rKtuLnk
         v9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794165946; x=1794770746;
        h=in-reply-to:references:content-transfer-encoding:mime-version:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9TFlHze0xZHVHECFNAToGkMpUA7NwrSzUebXukclDxc=;
        b=ko5XPb9LxWV6F2iSe2GvwUcRvKk2dkrWrJsl8lO2nc3X87kSDihxNLrtb4eHdR7y7G
         XzL37wghrUDAEby+06bRkQDT2oruu28G1DrPL1KVR3oTrtuihRXS138DAM7E3tJlrpkX
         RfUjzHGlBMFsLRWIVitb/k9V7Hz7A6lff75eis9N1+XXJvkeS8D8ZaCRnYBqMeI+n+zW
         //gQl8MLtYMxh83ZuzERicX2swALNa4QuuVRbLg/WiWZzPFZhKmdsBf+JQwsBPVVjosa
         MP5fa0JCQt2QPLEQQ32za1WMN11MLRXaW//M8+7UiZzop5TZ4tOZsWu2hWeU47clLesa
         AUzw==
X-Forwarded-Encrypted: i=1; AL+hErH4c9RYbi82c3kxjcPE65rudOtgJA6ls+fuZCRqru29pxYPJgBLBRQt+0lNq7ijOL4WcdiuJDG1ywe1UJsr+g==@lists.infradead.org
X-Gm-Message-State: APuU4Z9omkV4NZmXXJkqu5IFJSVRZGo3axJ/FuM3BK+m8sqNjzCDO2HJ
	B9Q/tLWmcagSyH4lWrOpOHMJxZlQgCOsGURYDN06kWWYb26CKIPoitnT
X-Gm-Gg: AYBFou2yb+YTY65eNRX7f6+KcGm1DJ7gGEtWh3wmc9Gae/atUrCVaSwvm1CMdzBzlwl
	GkH2jeKdGS8JkVACWQ3/IiqeePvDH7BV4XYiOjaK9lQi+I0MC8boADXDOXTn2vVvQ9FrqHQxLs8
	i4sH5WoRCRSVzUtGMYBiWReGKf4CBuwr5qPX/Y2Adcix+zVxBmvYpdYRVNmIstCVTm1Zjd5fB/k
	Sorb10ZHo+6An59nEeNt30ZovpMQx/dfYzWzeizsQh9iPO50UmUNGe99gPbrSuCOCrQUDR4JhMf
	G88iU9uQRPQLg0/B0K0Xsgvq0R650r5TFSJgn6aSdOVkYU1UlM6cUEnvS3IhXlz+oZSt3RoNztE
	NpLtjDsJgv82bRI1aE7czUDdZZVvF88QnV3TGnlN3tHyTFr/HCJuyHNyoTpsv82G7kkc9dbQ2Yw
	tv1r55JTU9C0urwB8YBagVnGpkxn1H5lofWWyzareaIWqO1hNrwdRZlUATGWSYGKUvXtX3u8Ijw
	+0XOWt9QIbIp6mW8/U7/NjRvrOGNI+zqr6suoyo6XrhzzVETlWHqgnxcU97vsxmxP8m4qGMjnry
	EopqH7zGAFMA5HlPbDSTq3nnt5VefWyEocuGo8VbJj6PbIxpH4hN07Jp
X-Received: by 2002:a17:906:794f:b0:c34:83c0:b92b with SMTP id a640c23a62f3a-c4d6d522af9mr142299866b.23.1794165946088;
        Sun, 08 Nov 2026 11:25:46 -0800 (PST)
Received: from localhost ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a998a5asm81036666b.72.2026.11.08.11.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 11:25:45 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 08 Nov 2026 22:25:41 +0300
Message-Id: <DMQ2QUT58NN6.10MAQ6P7FML2K@gmail.com>
To: <sashiko-reviews@lists.linux.dev>
Cc: "Linus Walleij" <linusw@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Sean Wang" <sean.wang@kernel.org>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 2/2] pinctrl: mediatek: Add support for MT6895 pinctrl
From: "Alexander Letuchiy" <asalde.le1@gmail.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261108-pinctrl-mt6895-v1-0-f704c443b31a@gmail.com>
 <20261108-pinctrl-mt6895-v1-2-f704c443b31a@gmail.com>
 <sashiko-outbox-203909@kernel.org>
In-Reply-To: <sashiko-outbox-203909@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_112548_231733_A9E75DDD 
X-CRM114-Status: UNSURE (   6.31  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun Nov 8, 2026 at 9:39 PM MSK, sashiko-bot wrote:
> [Severity: Medium]
> Can mtk_pinconf_bias_get_combo() and mtk_pinconf_bias_set_combo() read
> past the end of mt6895_pull_type[]?

Right, mtk_pinconf_get() reaches pull_type[] for the virtual EINT pins
227-246 via debugfs pinconf-pins. I will pad mt6895_pull_type[] with
zero entries in v2.

