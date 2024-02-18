Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F240DC4829E
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Feb 2024 10:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hYKNM0kFY4Gq7Ym7sCk5KLWQaWpDLT8Bshvo4HPFqPQ=; b=PSzqWpCsq7y3bh
	kao70dOCMDJSvpHx7TlBVAtPfVXDN9pC1K2Qy3v2xcLvxuTKsyzXE84jaLdjG/KL+8IjXZAxfFAdS
	V0wE+gEkN5PBfl2LCx3GY2tHpN5DF1IwJRInxQv35kqhjg5r1Cd0pGCxrAUV/cLe49WFfw2fO1LiF
	z67Z5skp4VbD8nYbHHEHnsIut1gUqwKAj35HHEE76rohFEMRrZ2QaXp7F6WOv9S+UkKibc/uAfoxX
	B5jViJpFNKvwk+dVgHXZ0fsXkcMAz7AwBWubZ8CtXZNav38WknTbyaf04yQaF8n6MqhTVTV7gPcMr
	VTYqbvTTN7mhsjSa0ugw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbema-00000007Z0h-3wMr;
	Sun, 18 Feb 2024 10:52:28 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbemW-00000007Yzy-3Y1f;
	Sun, 18 Feb 2024 10:52:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7F42BE0009;
	Sun, 18 Feb 2024 10:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1708253539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hYKNM0kFY4Gq7Ym7sCk5KLWQaWpDLT8Bshvo4HPFqPQ=;
	b=lxo8gYGpE+YJ1RA0OUoL5Jec9z+z036cSl6VSBM9jeRuCVjt6Bn1Xh7DqA7yFmIR8or84z
	yg4aHamwER0BvHyrJFgkjQ2SW0ntb0/Hkimm9wKip9A4IVBO0Dnfsf3f6DNKUEae52/nxV
	efmPi+UqMkFxmJSOyt284ty2f8sJC1B/f2p7QwiMtxCcqkE0MlpkcWf4JoozomBC0at90W
	Dyv690ZxsvLdY7oLfYBelwjGSerF7XBQKk9iWbZrVDgxvjKrBsYv+KSfKXzFkk1fMxtjY2
	uTnBtMoYNOZsxyhEENmqS+STjkPqjGLTXmeJ6r4CF/wCvgPCe2+LBnh9sLmqpw==
Message-ID: <5d582382-9a31-4a95-bc81-01d99dde0a6e@arinc9.com>
Date: Sun, 18 Feb 2024 13:52:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: {mt7622,mt7986}: add port@5 as CPU port
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20230918074938.79796-1-arinc.unal@arinc9.com>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230918074938.79796-1-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240218_025225_044096_F7014086 
X-CRM114-Status: UNSURE (   3.94  )
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
Cc: devicetree@vger.kernel.org, mithat.guner@xeront.com, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Matthias, please apply this patch.

Arınç

