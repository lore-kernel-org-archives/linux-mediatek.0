Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 967FAC54E5D
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 11:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cx8mkWD4hoeC85VHvjPgAWa8fqc2FEdHWl6oNhonM6s=; b=SnBOfy/KM0VQ1A8cnk6Emauh8H
	sXRXtNwFRqRA3ctiXnUVEc9Oi43s0lbZ6rQtB5pyGwaeUDmBOJ/lvZ9XKTNL1cNujMHO7SfcKEhEK
	G9xnk2n6DKYZMbOgf/JY7sxB4tHfQwJeP5/AwyUd0NdggoF3xDdhVoYjSS2p+2B47x7aJUvsQNFXx
	3muPCzbVu05YcTEKYxKKJxTnM8uzr1xkG2gZv85/HjWC/PmNT3oQOKkjk0R+MdHNFxJcIp/ttX1Em
	eSJomly0Wkd3fMoBUcOYriqYRydMsJymayJUtAA2PC4gAemun4f1Qw1Q4O4rjn7FezcaoUkPm1ix4
	PW+MqxHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmBDF-00000008NFH-28Z0;
	Mon, 18 Mar 2024 11:31:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmA6N-000000087P8-1Qdp;
	Mon, 18 Mar 2024 10:20:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=cx8mkWD4hoeC85VHvjPgAWa8fqc2FEdHWl6oNhonM6s=; b=I2HQO+HUKssrZCKb+/quAo3+WQ
	cU9ETQSey6qkUQGLaenIfE180j492ntdlgrj/NVENupdK8U3E0gG1zZSdDLxAFyIa2dXJY5yTSykO
	fo8bbrvK5iD3xKIXbREt+UGjCU28zTZRV7OpTVVRdWFH6//WU5H7rjO1hyRVowsWxC/trqyOvcxrc
	BQvvogd3hR+6qGP/nbAej2mwVwKTp8c9u8YPy70zWYZvtMrgkRKtgcwk6E44fGF/vqy8cdsYPsBRu
	cJ9f5Is4S3zz/SiFx/rbkrY9Ufgqr1ZHNd3Tn7wZnbMqa4KKQEi83DXvQvFsly4Mm6xMws/hrMFxB
	elKnmN0A==;
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmA6F-0000000CZsQ-30xt;
	Mon, 18 Mar 2024 10:20:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710757209;
	bh=Jv9+lrbEk7rDYbF+Jxgetn5HHZzzqMQUV/LX3UBjbbg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=c6KH/pmWD4Fl6g00e9ccwC2RcvxYoK2hBd6K5dHPHkIaqeFQhKJZtyJIVDmXxXTS8
	 6LiFGi20dqWMzAoflHpybY9FVRr+QuwT1SxZXnZjETG7pqdPPajSFmwuT0aeamoJ2p
	 ko+O2rY5NlKP2hZR+OQt4A8rs+l+V/TLCJQDtYygU0WVWDtFeXX5pgVpSsxgTruYWG
	 5Bu+SIPE81K3XQGF7QapRt5t5Kyid86hj5CxUU2Yd+NAm343x2xUmssPVkqmrjb7Ml
	 iB8q8sIWNe1UgQ0wcz3LXrvGzipGBjYZkymc9PDi+wZPVpk7P2C19RuaXCeGZccUJk
	 dRiylF989/Zyg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8E3E8378107C;
	Mon, 18 Mar 2024 10:20:08 +0000 (UTC)
Message-ID: <dae156b3-55b7-4c5e-8c42-3dab63e96864@collabora.com>
Date: Mon, 18 Mar 2024 11:20:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/14] mips: dts: ralink: mt7621: reorder the attributes
 of the root node
Content-Language: en-US
To: Justin Swartz <justin.swartz@risingedge.co.za>,
 =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240316045442.31469-1-justin.swartz@risingedge.co.za>
 <20240316045442.31469-15-justin.swartz@risingedge.co.za>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240316045442.31469-15-justin.swartz@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_102012_131875_0DE1883E 
X-CRM114-Status: UNSURE (   5.66  )
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

Il 16/03/24 05:54, Justin Swartz ha scritto:
> Move the compatible attribute of the DTS root node to first place.
> 
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



