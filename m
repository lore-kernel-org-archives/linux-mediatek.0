Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC72C54E60
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Mar 2024 09:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nSisC81XnyRtxg3gubWj67nRYu4zIsweXs6oT2yt8+c=; b=Oqt7SnYXm5jSuTcEIuGl+EJV7J
	gTUKRd8Gb35i0KX0FPGYhpLR5ddK9U+iDGmvlyHpHSf9XdagsSDisS+aRuHGy4JCissXBUWl4qPA/
	BVLErMGjqAfsVcJoYZDu3aM2rUsVZnVL45zUaJC4TpL8heJFlLG7Wb9h8F0hC4Nd8qKfWrdl5fpSs
	tXZ6KonPboWOMtPg9knnxqpvxfbdLrRsQJIDYsO861BhKWzgRRTeFyLYvn2jbYe3Qv0bieuzvtzZU
	7mxwvq2oNcKmMNaafIMjEjSc9gq79Obg/dWDXIfMvouQWVVSrJJOiZ++Gd2H70FidubCpi5L0R3gH
	qM9tapgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlQG1-00000002qoM-11RS;
	Sat, 16 Mar 2024 09:23:13 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlQFw-00000002qmh-3WUN;
	Sat, 16 Mar 2024 09:23:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 64886240003;
	Sat, 16 Mar 2024 09:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1710580986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nSisC81XnyRtxg3gubWj67nRYu4zIsweXs6oT2yt8+c=;
	b=XgCKzDgTlrDz22uKynZg3z/1vDUNSzOWgio+LTGtc15lUTWM7kVQ9f9aNe/81dme+BeDnE
	ok8ZuJhXbxAlbBtCKwNkYoJvt/TdzWf/FhkXTZNwoLkjdNeIdCbPz6K8omckDkrcWcL2Xl
	vGOEG8dePnDQxMsFdFUQpRyoC5VxKPzBexBEVLnHQDqVpue/sB23lPmaewUogzpPQbTk8d
	2QofVJHjfmml9hvM5d8Q3jrY3VLgtT8nQemJ0EVJvbwk22oHI8BU00COsumOcW23Zn7yuk
	v5Kg6hZ5Nkf2aTkS+2nEB+Fcoi3Mpl4FkBp00Hb6mCwlJUmKue53IcfD0goLtw==
Message-ID: <5200c802-178a-420b-8dcc-c70e3bb2dbe0@arinc9.com>
Date: Sat, 16 Mar 2024 12:22:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/14] mips: dts: ralink: mt7621: reorder ethernet node
 attributes and kids
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
 <20240316045442.31469-12-justin.swartz@risingedge.co.za>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240316045442.31469-12-justin.swartz@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240316_022309_040597_4004B4A9 
X-CRM114-Status: UNSURE (   4.70  )
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
> Rearrange attributes and descendents declared under the
> ethernet node, recursively, to follow the DTS style guide.
> 
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>

Reviewed-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Arınç

