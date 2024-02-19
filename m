Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F4A4C54764
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Feb 2024 09:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tfpHxAcfl5M2NGtp+kneEgWWO1Zl5+LXLY73+P7UT5k=; b=PkC1x6otfmTkpo
	N6ZTTqiLxnAZJb1Ur8yPDdYTPvXQNHF5jwXRR2IU6OLKSY7h4ifHo4JEtd3IBq7craI33XrFcOF3Y
	qKqKbIheJ4tYMFvzhlCNO4935uMpU9KCxUWWiF+OR8o+UBPxwetM2bsGwIpxB4eMrEGe8EnB76So8
	tloov3qr0Y7krzhyVUQVK87vEooUt52AMA9YH+SXkIr9HxyWffuV38bKEnIKNXQo+28DkcU0uv8ux
	WkfxLTYqM5jZkwY+uireM9cbrcLXnpQPLV21PAvkGcxpmyyxkQ6OKdMwvi0LMBeRTxtQz2ggW/gjp
	hEBemp0pnUV6vcUSMQ9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc06M-00000009r2Q-0iz9;
	Mon, 19 Feb 2024 09:38:18 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc06I-00000009r1e-0E74;
	Mon, 19 Feb 2024 09:38:15 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3CDB3E0006;
	Mon, 19 Feb 2024 09:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1708335490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tfpHxAcfl5M2NGtp+kneEgWWO1Zl5+LXLY73+P7UT5k=;
	b=ODAyBUXCl8yQM4qTctmYz70QQOi5vgZlS7TgpsCPz4ZPW3x3rTfBGhu+qm1C/jqljcwmos
	EoSsPdac6aGzYaSr4RCnI7/QC5DClNMsUTVE+A6cSzrg1voGInI3zKPwOT1OwrEcalroOp
	3Y0LT4Rx67IuRoFximD6UPR8heZIkCY/4WFGSZCSaGNt9WYnwP/U1ogOCEkD4ng58NI5rN
	l6kCnrTmPG1E93HfRifzEu+hCRHws03Agn9GZSalFPHS5vpkRqlOfeKzCS8RqGBAML4LHT
	PvZFSIGXfLKKKKpEj4y5TMU04hxBci0P5z/5zmP6b+cBZ2L/aD+HD+O1awftWA==
Message-ID: <27b9f494-b824-46b8-9028-23e2ed1ff0f9@arinc9.com>
Date: Mon, 19 Feb 2024 12:38:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: {mt7622,mt7986}: add port@5 as CPU port
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20230918074938.79796-1-arinc.unal@arinc9.com>
 <5d582382-9a31-4a95-bc81-01d99dde0a6e@arinc9.com>
 <2795a056-eac2-491b-bcb5-52bf4a331c07@collabora.com>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <2795a056-eac2-491b-bcb5-52bf4a331c07@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_013814_252210_6D466544 
X-CRM114-Status: UNSURE (   7.03  )
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
Cc: devicetree@vger.kernel.org, mithat.guner@xeront.com, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 19.02.2024 12:17, AngeloGioacchino Del Regno wrote:
> Il 18/02/24 11:52, Arınç ÜNAL ha scritto:
>> Matthias, please apply this patch.
>>
>> Arınç
> 
> Please split this by SoC and resend as two patches.
> 
> If you can resend fast enough, I can apply the patches for 6.9.

Done.

https://lore.kernel.org/linux-mediatek/20240219-for-mediatek-v1-0-7078f23eab82@arinc9.com/

Arınç

