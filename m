Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8EAC54E60
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Mar 2024 09:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/R89qJGYnbeg9WVgcaQ8Cba+D/WxrvX+F1zgBiCfzWc=; b=U9f8IcUjz8LzZZKZFMvxlRnzww
	il1ycw9Z+TjM2PPHpxCqGOdvA+NRw8oKIlJWJCfCrVSvOr0V4LuR35BgSEtd2bm4Loo6hbqQv+UGI
	OP2R0hP6DtTZt+47+m2eojweukxF0oMICXe9d7E6NyQFa+Cs1LUpYlmmt9+NJZBTZO8djRfL4Nx0A
	reRgPgsN457l8gfG3Msdryzt8KqJdDGLRlOZKO6nwVq+qOSCnY6djFfo357/THuGavGv2RWggFQ3o
	WiPhl9y0SHDeEJhoWSgghJ21cMHQ/VXIlfBSLkTY9SRdCppIHP+GsFrZhd59TVcGPZ2Bsht+x0GMy
	M/tbphlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlQEo-00000002qNa-3MwZ;
	Sat, 16 Mar 2024 09:21:58 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlQEl-00000002qLw-2cYY;
	Sat, 16 Mar 2024 09:21:56 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3879920003;
	Sat, 16 Mar 2024 09:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1710580913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/R89qJGYnbeg9WVgcaQ8Cba+D/WxrvX+F1zgBiCfzWc=;
	b=A5SYvb9/N7NN+b2Ch960ECv6QpDXu7CMYPuwjq5pqY1NoidhgH14sYCDwS6IgCQsjlqwhm
	E7HvuE9gh/2ZuyRB/Z62wMBAKxtJxB25yECBpZrOINZw5dtANDM7ZMOri5cttsEeJFa0rW
	VqMF5r2I+Ve4qd7aN5+IibF9+eGBBohdk22OD+66gbenj2odO9rnMtEgeC8re/Nph0kl2H
	tgGloYUgdYhCukQmarHCcfzaiwtG8S0iHvZ/+LedS5cQAJpa0pkRXKgZmp9pyP0QdHsKEJ
	Rh94gFlD5zN+YBSaLzJ2ECluPxN02Dj+0nQMGA5+ukzIO9NVL5QcG/CggKKkUw==
Message-ID: <659f18e3-ed71-49ac-a019-956a7fbdc215@arinc9.com>
Date: Sat, 16 Mar 2024 12:21:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/14] mips: dts: ralink: mt7621: reorder gpio node
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
 <20240316045442.31469-6-justin.swartz@risingedge.co.za>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240316045442.31469-6-justin.swartz@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240316_022155_824392_BFA20D91 
X-CRM114-Status: UNSURE (   4.69  )
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
> Shuffle the attributes of the gpio node to appease the DTS
> style guide.
> 
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>

Reviewed-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Arınç

