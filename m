Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5394C54E60
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Mar 2024 09:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hv+UwewAEKLX3sRoKbyFtr4qE0xFXncm9vTyaUOdRzI=; b=maIg3w8RiFI3n36YaSnup0KJtc
	W3f6oAg39j9HXt1OJf9XFEeXAP2lqft+bf5VjhPcadgbsYTf9NnfPTTp3jfh/wOogqgGt5I1tVMER
	wdW16n1HkJgcjcbTXFa92aYreV8FDwbp1Ui1qqn+4NNvCyDdLWTPAVGG3NWmvUXrMAOuUGmclReW1
	IXfO0whK4IngUqL4FD1i/TcKA/k4/mfXLGCNW3zkZhDERZJyTqfV5nEiQp86TnXvps7MdH1J/rvaM
	f3PwQLGKn6jsopOWEr5MgB0ysQ8j0kuR+8P58XvvRoWzFAHcDvH1eMTLqXLbBifHNusPPXYV0sSbg
	GC8mXrxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlQFp-00000002qkB-21BB;
	Sat, 16 Mar 2024 09:23:01 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlQFl-00000002qjC-3sWd;
	Sat, 16 Mar 2024 09:22:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A2C73240004;
	Sat, 16 Mar 2024 09:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1710580976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hv+UwewAEKLX3sRoKbyFtr4qE0xFXncm9vTyaUOdRzI=;
	b=YqukWb12YnFeAGKUWMIudHEEZSYVNZI7THHp21YLt4YIg1c5WX0q0sqeyhtiy8yw61mzP4
	CE4dVws9FLgR5Uj7CJiSaqEsQiCd3czJARh/25PsBlm5I4MLaemSsvUhG3EXnseQpwWTHB
	+JX3YsfuW4gX+3XwZiYR3q2OuGJtIermSNgSQhlk+9ndCoAToW9VNlFM0KDC4C3dSb0RkY
	n70VO7nVqVUZg+rqZnf5WcBl7+s3KUsluwZjknVuJYECYp9NQQk6QAu3yABln0Yq49w31d
	PDEwy9UGQ4EBjY8+Mn4/q6KBT6Krgdjx7ukV2Irkzo9cE1Wkqrhvo4zWKK0A2Q==
Message-ID: <484b0699-2be4-4e0c-a60a-73d15702b6df@arinc9.com>
Date: Sat, 16 Mar 2024 12:22:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/14] mips: dts: ralink: mt7621: reorder gic node
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
 <20240316045442.31469-11-justin.swartz@risingedge.co.za>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240316045442.31469-11-justin.swartz@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240316_022258_128653_2B96D139 
X-CRM114-Status: UNSURE (   4.48  )
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
> Reorder the attributes of the Global Interrupt Controller
> node to fit DTS style guidelines.
> 
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>

Reviewed-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Arınç

