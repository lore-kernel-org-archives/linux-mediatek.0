Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1A6C47DA9
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jan 2024 10:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kAIP+HxvmUVxXdBp3PdQcGATlDYtlsu6tH37Os5WKtw=; b=EfIrC66d+kIRZChKBirQBSxSrZ
	+Iw1NwJV3y9FjZMPTuNfdUT6SxzHLArP6oBneW0ktIlhcFQAvs28wlsAS6fLWZZWsm6xXv6VNvzRC
	6Iv3JqvQ+mFiaLJv36EqWg5T6gX7GEoWdd3xiOkFsu5PVQET2e7lpTSQbHi0WRMMDZLur91T7AP/o
	f7CvD58/pSMibK9s+v4mYL/SKqmOri9XDzHtb+FPXnmcYBk+exXwYpfLoy4/Covvnv7UPC0s6Aj9v
	QYsyiwjCQdeEUSgXmvgbmTB+AMslR1iOmqvs93XRZdC4bngbl2xmKJsoukLVwuP8lKrbg8Oev2GwU
	rBLdWYOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUPBQ-0000000CHxb-3lDr;
	Mon, 29 Jan 2024 10:48:08 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUPBJ-0000000CHtI-23uX;
	Mon, 29 Jan 2024 10:48:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706525280;
	bh=xEqQM1fzy9szP+fpqrJ11n+/1aP8eVpnc7QXFhpkMec=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PWiNFEaj6ZhhaWudOxKUE7+4KkASnAySS/YDm22TwFah+JKIH57MNUdRqrygzZ/l2
	 ckivlCZ3tgV5vCHKVsH5R77QdNxSXe2oyVN1o/QRgoejKWLhQOdfre6r/iOm0rIlkL
	 FRxe8kTulECeWbfVgT0INS2b2AjVAMXbdjv37H0Lu8BPTzN74DdbeXJxiWEtsIK9NC
	 8NUwmWg2ZAkMQI53FRmnFDwtUyqmGmjQ7H6p2rQ2vjm480F8B7bdHqUIWkjXCuaktg
	 ja0DYn+xufl6U6IsybIe9YdMVaxs84Y14f2v3kPU7v9rF/L8hjSEfo0MS2iSqdpz8i
	 gDo1A7ri6M0lg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 907F13780C1F;
	Mon, 29 Jan 2024 10:47:59 +0000 (UTC)
Message-ID: <282822ba-0e96-4078-a807-4b0b08e42014@collabora.com>
Date: Mon, 29 Jan 2024 11:47:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: media: mediatek-jpeg-encoder: change
 max iommus count
Content-Language: en-US
To: tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 Eugen Hristev <eugen.hristev@collabora.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, bin.liu@mediatek.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 robh+dt@kernel.org, kernel@collabora.com
References: <20240127084258.68302-1-eugen.hristev@collabora.com>
 <170652472373.127352.5854831299483160743.b4-ty@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <170652472373.127352.5854831299483160743.b4-ty@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_024801_772318_C89F3DB4 
X-CRM114-Status: UNSURE (   7.73  )
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

Il 29/01/24 11:41, AngeloGioacchino Del Regno ha scritto:
> 
> On Sat, 27 Jan 2024 10:42:57 +0200, Eugen Hristev wrote:
>> MT8186 has 4 iommus in the list, to cope with this situation, adjust
>> the maxItems to 4 (instead of previous 2).
>> Add also minItems as 2 to keep compatibility with current devices.
>>
>>
> 
> Applied to v6.4-next/dts64, thanks!
> 

Sorry, typo: v6.8-next/dts64

> [1/2] dt-bindings: media: mediatek-jpeg-encoder: change max iommus count
>        commit: b824b32dd5e98221cbe2e8bcccc6fb4134e35fc1
> [2/2] arm64: dts: mediatek: mt8186: Add jpgenc node
>        commit: 4c5b46fbf52d52b0f392f0fc3913560bad438e49
> 
> Best regards,


