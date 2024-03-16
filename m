Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D74C54E5D
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Mar 2024 09:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iJvqEwG4BCgOwSG5jkCwsuNB3D7Qx69A0zVN4AWW+x4=; b=quhFq8Bh+t8zGf4niRXfgcrkGN
	1QtsB3Lk0mUmSwIwZt8L4MrajQ4zFS0t+MTt6CtTwwqslTEXYZ2AM8F6SUV+eiybyf56Z4MYmAH1r
	UCA+xmB0wp9PcjPP+iWN7zoGJzjvQ6OH17IcKifZ/sX0TBKs1K+pQtxB7ASFuuPfBJ5McjlVW9t+/
	CP21V7Z9Jrweb91lF81SJ9p7HWGT74r4SepR/qLbbsToYR9QF1H/5Opzo2wsjdwT7GeuNTSOYfpGh
	Z/YcdlRx+hF0U+fzb2zJ9Iki0uAi6JS34qCnTwZqqUUwQH1pl4SQg+H3ALHz7sfJY51EviHbs0rJB
	I5audVeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlQDm-00000002q6H-3CqE;
	Sat, 16 Mar 2024 09:20:54 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlQDj-00000002q54-06CO;
	Sat, 16 Mar 2024 09:20:53 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A7B1520003;
	Sat, 16 Mar 2024 09:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1710580849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iJvqEwG4BCgOwSG5jkCwsuNB3D7Qx69A0zVN4AWW+x4=;
	b=NHR0+/owB774mqHdvrUBgi38JgJO1jT/4V9TDoTNg4i2kRgq3y0UAKjZ0+cpkDKGZAT+B6
	qVJvw356V8aoRqNCXKkWPxbzL3v0jdfOXKPO9Hdtk6/UPctAkisvxSyAylKpnGIVJmuV0n
	RcBhHN2GSN+osYat23JB+fNQ95BGF8jvHBeCU0c6Lxs2rQOJsI9EQiYSN5XCltviFtg4fh
	Lnj1vNyoeFdFeo/gCBkg4kNFsXVceoPTaM3/zOlAmXE0H6dAySS3ruqFjFkn/zNY3rm2Yo
	QUDcE4UiH1Uk3Ol1zqeOWzFMXwHr2DPkqe+b9sCSqQwCpp5M+uerWWfIBHfPhw==
Message-ID: <e4d77218-191a-475e-8689-3bd5b00a82f8@arinc9.com>
Date: Sat, 16 Mar 2024 12:20:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/14] mips: dts: ralink: mt7621: reorder cpuintc node
 attributes
Content-Language: en-US
To: Justin Swartz <justin.swartz@risingedge.co.za>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240316045442.31469-1-justin.swartz@risingedge.co.za>
 <20240316045442.31469-3-justin.swartz@risingedge.co.za>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240316045442.31469-3-justin.swartz@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240316_022051_782763_65FD3983 
X-CRM114-Status: UNSURE (   4.35  )
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

On 16.03.2024 07:54, Justin Swartz wrote:
> Reorder the CPU Interrupt Controller node's attributes to follow
> what the DTS Coding Style dictates.
> 
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>

Reviewed-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Arınç

