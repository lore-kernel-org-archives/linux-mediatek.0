Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66775C54E69
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 11:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6y73tm4gKMyZT02rdtKY5ruUKwUOvdOdIXJTykhtpMI=; b=FtR5MBu+kxlMBVzXok4wauILiu
	FbYntF0W+LiVAhV8INlm5KmsGTnq/ETrY6QL0L75yHb3+Hpl0/kLZ35HlTF3ER2cmc7wl7V8lRDnQ
	LZ9JFppO9CjyKNQ80Wg+s+yiHjJZm72xAL15rOqVP2cKr2hbu7ai0t9VLJwoNeFnKa03HYuvUAugn
	Ik9apeOHfikWifdSKD0XUN45vrRwHiBFYOjbT/PGfbr/NNaaSiaWd+2uw4DEaDeZmD4gXY/MlVqVi
	L2/oPEE2w49rPNKWXNRseYZAzAggIGXRVsR4A5QYe0OlpO/w2/7nP3OnmsZiE68/ZgaZir5+RmU6f
	lUXLYEaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmBDc-00000008NYK-2GZC;
	Mon, 18 Mar 2024 11:31:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmA6T-000000087Qk-0OoE;
	Mon, 18 Mar 2024 10:20:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6y73tm4gKMyZT02rdtKY5ruUKwUOvdOdIXJTykhtpMI=; b=MmBcVWhfipiHmDem9aE3bZTP/z
	kqnSJk6lsUp38wBQWGVM0E4Go9A0aUqv7gYTuh1w2ev2xynals1HhOpgsYertf7MLHPcTWwxoIVo1
	3XyH4p1jijxdyX9ptj7/UpWIL9LPDC06Y2Ik7VwClP2JHscm+M1ZzyiG71O20eeYABMXY1g1x/GVF
	jwdbEzRDeQTE8Q4e8vmhg15GpEN8IUzQZC5qP5NTyH+/euxA5R3pSelHHXK9ZbLfKHL3gF/ZPa135
	KLygqHc5EjUYoAbwHm5J1RhqOqyiRZnPb08PvW/DxSb+lR7xqhxMZXGhfvsagMKuxgI5LQrZ34+EZ
	2zSdJTRw==;
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmA6M-0000000CZt5-17ZC;
	Mon, 18 Mar 2024 10:20:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710757217;
	bh=vR7izpRoiDi/gPzIug7bV7g9yuDMhkNGfayv6OIoOKk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qiplwgqSWKamgDurNozVDjVII5q1ncJP41gCnSAHfu68d4samcDpRd8gBOEKPF90m
	 XyfI/4gJu8pSYimwi7M7jhXwrSe/s3ROrOMGp/oxVUPffBR3qIn5iy1EyXNEtSSrSH
	 lGoJWOelM+WjxybIUScbxeZ6eatOuL/zCcowz6luNzWXqKVh174WUIr9yu8b/A3j2y
	 fg2VFRGn3SPSQulbeYyHb+XQEodJ1P+Opcws2Q8AWXLpjJTMmwg+kAQRYt3qlupz7J
	 chRVpqqeyT2yt2ok9P4d1v8/fLg/dQPq4QqKPjaRg3HYdw+16akm7bCNiEnLEW2pz+
	 91w4rJqvkjSuA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9586A3782082;
	Mon, 18 Mar 2024 10:20:16 +0000 (UTC)
Message-ID: <976c0107-c14a-4b78-8788-3238322a8ad3@collabora.com>
Date: Mon, 18 Mar 2024 11:20:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/14] mips: dts: ralink: mt7621: reorder gic node
 attributes
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
 <20240316045442.31469-11-justin.swartz@risingedge.co.za>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240316045442.31469-11-justin.swartz@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_102020_242411_182BE758 
X-CRM114-Status: UNSURE (   5.79  )
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
> Reorder the attributes of the Global Interrupt Controller
> node to fit DTS style guidelines.
> 
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



