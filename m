Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEABC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 11:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s2HQ183MuP4PyZczBhuNu5jZ5LR54nQe67j/araGpFY=; b=a0tK2zxFqbYPbFkURRJ0y+880+
	IdNSUr2mKgh4SATvtrxOhJhL2DWWWMQSrnplxB0CnbvWawbv0fiOpdbV3UYQgkocrYaq0kVejU599
	i3q6UR85EEWBVCnqcUWhqyrAB9rxzbT5KtmUxM88Heq1+HBHWnVP2dNLl/A4lQdnyyqFYBPiJKiPF
	pN0OFjD6LnsqGQbDiH7EvurealrYRqy1QN8kL3GqjsTuIVGqSGLHq7lY8DxX3G9/jeE6kc8Cvp5MQ
	Jej9bEiIPiPPAuqnysX0HZyrz6ALyPe6NQFiSZUPlIXKw1VK/CxKgAw1+z623fLmqfSEzhozh2M/o
	8EQYtVWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r13Qs-0066eI-2T;
	Thu, 09 Nov 2023 11:42:46 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r13Qp-0066c7-1X;
	Thu, 09 Nov 2023 11:42:44 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E1593660748C;
	Thu,  9 Nov 2023 11:42:40 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699530162;
	bh=1GoPKkfelm7WA5wubXkX1TePXQHl6eXleQyR1wZu/jU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J7QjPbn+DCFzDj/lZM65PkFvyBeOgJ0X9MqINxhS2snOAqyP7YWlukAJHcOkytjLW
	 FlFkqXsgIIh3btGhQm0HeLKpIspT/Jtw/9KDu+krYt4fXcPWrnNWffM1gcOlSsML80
	 prO5jvjGdW9s0udCI/3tIO0viV9D868C1U5TBJdsrKmLbdYV6OsgVCnDH4MBgDga9w
	 Mlw3osPw2glZYJZOsN4TbZrrpabskNJaY4U47fAvR0nliar/xJaOt00AAW8Y3bEA2O
	 9bvJo73NWZzGmQZ1TbDruaY1btmEwFRfP9r8HiJftUKD4cG/VbaqyNm72drBiRY1fp
	 TLPCY6OEnUZuA==
Message-ID: <27ee57f8-59a3-4834-8744-9b8107dd6521@collabora.com>
Date: Thu, 9 Nov 2023 12:42:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND 3/3] dt-bindings: arm:mediatek: mmsys: Add VPPSYS
 compatible for MT8188
Content-Language: en-US
To: "yu-chang.lee" <yu-chang.lee@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: "Nancy . Lin" <nancy.lin@mediatek.com>, Nathan Lu
 <nathan.lu@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Garmin Chang <garmin.chang@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231109111122.371-1-yu-chang.lee@mediatek.com>
 <20231109111122.371-4-yu-chang.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231109111122.371-4-yu-chang.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_034243_649443_E1F7BED5 
X-CRM114-Status: UNSURE (   4.71  )
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

Il 09/11/23 12:11, yu-chang.lee ha scritto:
> Add VPPSYS0, VPPSYS1 compatible on Mediatek MT8188.
> 
> Signed-off-by: yu-chang.lee <yu-chang.lee@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



