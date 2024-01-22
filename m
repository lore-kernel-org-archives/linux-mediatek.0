Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBB1C4725D
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jan 2024 10:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SipZJc99j0I/1X4Xuui9r9+HPmEcu/KZrm21kShk30g=; b=VFsAFVrOm/XeiAhYR8u7r/mSxt
	lqEVCFHUTyCdH+eP14xWXrtc4mJUqRMSJthJiJPGMWGG9d8yd/UqXfE/U2MWFNRuQL6/BKyKVVuEo
	gfVvoU2b/c1pQs7JgrrU6Xuvv7t+tVGhVAJRHUlcqZvnZvqX8KfaY4RfKyteZiRpD6rkN/79b1efv
	LRUQyvixyR/psAkjCDry5ljLN1WvA2bqVBqwNN8b2pyOhyn9hSa//v0cIYsoJqPi54k+bmT1/5ttN
	IUMP98Gmx0dEN81jviSbUBw1mb9VUmMZBCvBAhmn4xiP0is+8qTQpMK6CqkxOTrzAYTZhqZ1rLxMz
	S9YzHtlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRrWa-00BWnf-0W;
	Mon, 22 Jan 2024 10:27:28 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRrWW-00BWky-1A;
	Mon, 22 Jan 2024 10:27:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705919233;
	bh=FY7Gp4Bm7Ak1n3UKFzuIDhZpSZ7yf3MtGEoBq1h4qog=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=3ipDCBV1tGi+R57x5vNj70y1cbLC1IqLgywON8LSpS/kJiTvskpj1mqM3B6xogwW5
	 gudbyZeFgyUWu0X2rVXe+vWdTwhABaT63vlwVrpwGmWCy1PHmWMVqQOsbe1I7LWTQK
	 BKKXDLYDUEUxW6JTdLORZzK9kU7eVXtrOUsaD9V5RtYTNfqQbZqzuChRS3ZZfjHQ/T
	 VAYhTigFRb3nrOB83GVB7pWzUN72isGFkQ2/ndbC4oIy3vE9X19DxSgUIHAq1gMe9A
	 g9LXeur952anKfWqujvlxqVlqNGu5JyYCcvu/9tLCcCqhgstn8XXl9hyvP3zPKLiNV
	 wVj/nuwT9yGLA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6E147378045F;
	Mon, 22 Jan 2024 10:27:12 +0000 (UTC)
Message-ID: <9605c20a-12ad-49ad-8114-d59f2f772514@collabora.com>
Date: Mon, 22 Jan 2024 11:27:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: Introduce ITE IT5205 Alt. Mode
 Passive MUX
To: Conor Dooley <conor@kernel.org>
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 heikki.krogerus@linux.intel.com, matthias.bgg@gmail.com,
 dmitry.baryshkov@linaro.org, neil.armstrong@linaro.org,
 andersson@kernel.org, nathan@kernel.org, luca.weiss@fairphone.com,
 tianping.fang@mediatek.com, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20240119125812.239197-1-angelogioacchino.delregno@collabora.com>
 <20240119125812.239197-2-angelogioacchino.delregno@collabora.com>
 <20240119-remedial-unripe-2a3a46b4f117@spud>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240119-remedial-unripe-2a3a46b4f117@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_022724_576165_622D3821 
X-CRM114-Status: GOOD (  15.91  )
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

Il 19/01/24 17:18, Conor Dooley ha scritto:
> On Fri, Jan 19, 2024 at 01:58:11PM +0100, AngeloGioacchino Del Regno wrote:
>> Introduce a binding for the ITE IT5205 Alternate Mode Passive MUX,
>> used for connecting, disconnecting and switching orientation and
>> control the SBU signals for alternate modes on USB Type-C ports.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../devicetree/bindings/usb/ite,it5205.yaml   | 72 +++++++++++++++++++
>>   1 file changed, 72 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/usb/ite,it5205.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/usb/ite,it5205.yaml b/Documentation/devicetree/bindings/usb/ite,it5205.yaml
>> new file mode 100644
>> index 000000000000..36ec4251b5f2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/ite,it5205.yaml
>> @@ -0,0 +1,72 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/usb/ite,it5205.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: ITE IT5202 Type-C USB Alternate Mode Passive MUX
>> +
>> +maintainers:
>> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> +  - Tianping Fang <tianping.fang@mediatek.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: ite,it5205
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  vcc-supply:
>> +    description: Power supply for VCC pin (3.3V)
>> +
>> +  mode-switch:
>> +    description: Flag the port as possible handle of altmode switching
>> +    type: boolean
>> +
>> +  orientation-switch:
>> +    description: Flag the port as possible handler of orientation switching
>> +    type: boolean
>> +
>> +  ite,ovp-enable:
>> +    description: Enable Over Voltage Protection functionality
>> +    type: boolean
> 
> Bitta devil's advocacy perhaps, but why is this DT property? Is it not
> known whether or not this is supported based on the compatible, and
> whether or not to enable it is a decision for the operating system to
> make?
> 
> 

AFAIK, not all board designs can use the OVP. On some, this may be unstable - the
use case where this can be safely enabled is when there's nothing in between the
mux and the controller, and between the mux and the port.

Cheers,
Angelo


