Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F15C83F1A
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jul 2025 14:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eWmW202fKN2m55O+smSp46+HpeMk9N6O4tiZVZkb404=; b=FUU5lyBjWNZ04tYm3Z0a4Sj2r2
	nulPQyEiXSnKTZOGiZm5pCyyEFZJ3+66pDUAXO9BQw9cmc/tXgRG4ZG3Gok6CV43uTI3YAzhg/gEb
	qojWkjq6dbFnUeFEyLab1KvH94QSA/Uso7Dyni7wAt+LqzUp0b92TMupSBdA3l6fzkHxZP/0QZ6XT
	4ORBD3pdKmYZfGjwCB5ytghN8uACj8AMlepBsfe3abhpIO4ggV7qVfc0mjU6g9h0J/nZoSSMoNbuV
	TVox7qENYhht7ImggCdHdIgPnR6SwsJlOhlyImUIyqxhx0lrXuqsnftLCcu2jvV+Jvp+xfihTTH9t
	pb95L0DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueaWj-00000005D5H-2MYB;
	Wed, 23 Jul 2025 14:33:01 +0000
Received: from mail.adomerle.pw ([185.125.100.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueZkW-000000055is-35sN;
	Wed, 23 Jul 2025 13:43:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202506r; d=adomerle.pw; c=relaxed/relaxed;
	h=To:Subject:From:Date:Message-ID; t=1753278174; bh=eWmW202fKN2m55O+smSp46+
	HpeMk9N6O4tiZVZkb404=; b=MyEuCp8jLg3wVPiud2UbpWmVecvRtsBgHmk0wFbcKT0UQGl5uB
	+ULUxVUCfThbckljFSg4ucQsiD7wL43Yzn9WiyZcvKoVSWyZSOJRWxG+nej/xl8p5S7QjOm71aE
	nkMXT22G29dBlb90mRNyTBciN1duOUOZTCVzalIQvVkStbM09kHinSlIMRJjePNvmBrS38d/Bn1
	E2HhqIMZxbOoW2XP9KSMiqju9KPnFbA9vmGQFJvZzTcD24MNgMyifA4bkvK6GhAVq+aVZHwwCBs
	8Kqg8AeNBcUbmQT2io5pUX6TxwfCAF3+VhUfLQE09teaq46mzT+Ty8akSgRpg+UQtCg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202506e; d=adomerle.pw; c=relaxed/relaxed;
	h=To:Subject:From:Date:Message-ID; t=1753278174; bh=eWmW202fKN2m55O+smSp46+
	HpeMk9N6O4tiZVZkb404=; b=VrfC2+B5FlWRLIEq4PKFokKKZ4PVXdA4j+Osyj+L1kI9BPgFf8
	hbg1/rpADS6lx/f2JfuFPIrm30tIKlfptwAw==;
Message-ID: <3c6cb602-63c4-4384-b4f6-1705167d3759@adomerle.pw>
Date: Wed, 23 Jul 2025 17:42:52 +0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Arseniy Velikanov <me@adomerle.pw>
Subject: Re: [PATCH v1] dt-bindings: spi: mt65xx: Add compatible for MT6789
To: Rob Herring <robh@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Leilk Liu <leilk.liu@mediatek.com>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20250715231921.4527-1-me@adomerle.pw>
 <20250720223451.GA2915764-robh@kernel.org>
Content-Language: en-US
In-Reply-To: <20250720223451.GA2915764-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_064312_936723_6D12AA41 
X-CRM114-Status: UNSURE (   9.29  )
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

On 21.07.2025 02:34, Rob Herring wrote:
> On Wed, Jul 16, 2025 at 03:19:21AM +0400, Arseniy Velikanov wrote:
>> Add a SPI controller binding for the MT6789 SoC. As a note,
>> MT6893 SPI is fully compatible with this SoC.
> 
> Then you should have a fallback compatible. Otherwise, there is no
> driver change here, so how would this even work?
>
Thanks for feedback! I plan to send a fix in a new patch series, where I
will add support for all compatible hardware.

-- 
Kind regards,
Arseniy.

