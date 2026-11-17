Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1B9606A31C
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 11:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WTpnaiKF;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=lcoA3U+t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ahM/P/idi1IClfIdMjJVwjzYB76O8a82NQvzY5p1FKI=; b=WTpnaiKFSF40Y0
	h+QMy/bCr1LQabIzHPSHEZNMp6mAYAqCEK5JNhsOhtu76t2Fu6HgL6npBWDLDUZWEcThrRa9sB/2E
	I/fOc4W6jKlPKEKGd0caNL1q/WLpgQvVB+5XBOK83tCJAbefeLVnSC0Ag9PP/VvktBb8UmnPH6nmT
	ff6UkGz9JpcX6VTzpzYcOvyGh1JtiDxwYI4rlD1zjA2lQ3+J+bh5zmI2nu0htyAC7vFBxZefqEMQB
	5ne+T0yx/ykdyFMSGmkQuHOZK5HOujD4Clm16inWoIyJ5hFbtE2AaHpemC3rWNUK5j9Zo3L46mS2W
	GqnFRGcL5vz7V2wfUQIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTH5M-00000005Ouh-1rRm;
	Tue, 17 Nov 2026 11:10:48 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTH5G-00000005OtA-3pM5;
	Tue, 17 Nov 2026 11:10:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794913840;
	bh=TsYVa8isDVataCZgNzSJYbWDvnoB0Lq+O1qTliUZPco=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lcoA3U+teuYzs2jPvFXgWSwLi96f5Dn7/ylXITEs6Lo19EEPT+wJt6/uztcAR22BG
	 +KI+EEyoncZOoAzhnny98sf+OBaCvyHLEvuam5WS3VjCUK5aira2qhdv4LmhGgUnkc
	 UOcwJsFofIScApVAlIrsaCeA4HHvqEUomYvvl1VQTWcidsmKkBRc413NkyP64HSPro
	 UP7qhzP6LRoI7iVyIkxCzXrx9NFaZ0jU7ho7Lgba2E5s2gEuzbrEN0w7k5cDX/RGmA
	 rlHB3DvCpLg0s4LT7WdQ0zf27JWbBvXIbF5KQSuC5Zpy2cuZw68nmWqcjuCUUL9qmz
	 Mt42friiwnmwA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A3F5717E07F6;
	Tue, 17 Nov 2026 12:10:39 +0100 (CET)
Message-ID: <7bde7e86-3b4f-4f76-9d6e-0a98216ce740@collabora.com>
Date: Tue, 17 Nov 2026 12:10:39 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: mediatek: Use DP AltMode defines
To: Sebastian Reichel <sre@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, kernel@collabora.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20261017-dp-altmode-dt-defines-v2-0-7ab3d93553dd@collabora.com>
 <20261017-dp-altmode-dt-defines-v2-3-7ab3d93553dd@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261017-dp-altmode-dt-defines-v2-3-7ab3d93553dd@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_031043_125691_4E6E60C3 
X-CRM114-Status: UNSURE (   9.10  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/17/26 21:59, Sebastian Reichel wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Use the new USB-C DP AltMode defines for the SVID and the capabilities
> VDO to make the DTs more readable. This also fixes up mt8390 Genio
> platform incorrectly announcing UFP_D (upwards facing) support. This
> feature is unfortunately not supported by the SoC.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


