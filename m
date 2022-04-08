Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FCFC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 09:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P9qlVVRPG1Itgr3hHM3q6WFveJbl6JdfqGxhu//ZZk8=; b=SeKHImZzBliQ05
	rEsawGx9EcvE6JnCXrt5ekixdlOnyqlTO2mZv33Mbu+v9v1eYsbSTy/Jl5HDuYm8hkO+heljM3vzY
	eDMG/QWsh92jZI6ioxLcGlFuIkwIjDeES4pKWhHg/Z9aytSpnafOvhfiNQ7XQ0itfufiXsUn2qpGk
	wij8QEkdKuctSQ+8V17wzEeh8fDkAfpY/tAE4YNo85Q/dYEWGic0S7JQx1PIYHmQTNWjANUMfl8Nn
	5vsPjPEZW02GybezvBX5jGdr/EA2VOO4a2iLl+7RKFstTOAkjN6TJzikj3NC//3V8o2VfsMjrShnp
	Tl6xXCG9rKvonAJL9Gww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nckWj-00G2Kz-Hd; Fri, 08 Apr 2022 09:03:33 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nckWY-00G2Iz-Sn; Fri, 08 Apr 2022 09:03:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3rpjg5Y91rJlgDeWKeNVL63VHsFaTGQWttlj6s5sV2o=; b=ZsyVXJW+qTz67jq5E82oaR2nXo
 br8DmLPxSWOXp1ShbvI27ilcs3GA+JvX9nwaCn8CJDYZPGQ89l6WuepFWpVhgbEXqEF4a/RAKA5iM
 AO7Q+q5Siwb2UJWR3JINtlxjWqZ0BcJEYhvOcTqD0XloVc/cZYtZyl2FYkb9+KBwAwhY=;
Received: from p200300daa70ef200411eb61494300c34.dip0.t-ipconnect.de
 ([2003:da:a70e:f200:411e:b614:9430:c34] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1nckWR-0004kO-B0; Fri, 08 Apr 2022 11:03:15 +0200
Message-ID: <96bdfd6b-4c22-9a32-48b4-1d2cc8a16119@nbd.name>
Date: Fri, 8 Apr 2022 11:03:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v2 05/14] dt-bindings: arm: mediatek: document the pcie
 mirror node on MT7622
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: netdev@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220405195755.10817-1-nbd@nbd.name>
 <20220405195755.10817-6-nbd@nbd.name> <Yk8dHLDG8EHKtl54@robh.at.kernel.org>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <Yk8dHLDG8EHKtl54@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_020323_140709_534BD808 
X-CRM114-Status: GOOD (  15.97  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 07.04.22 19:19, Rob Herring wrote:
> On Tue, Apr 05, 2022 at 09:57:46PM +0200, Felix Fietkau wrote:
>> From: Lorenzo Bianconi <lorenzo@kernel.org>
>> 
>> This patch adds the pcie mirror document bindings for MT7622 SoC.
>> The feature is used for intercepting PCIe MMIO access for the WED core
>> Add related info in mediatek-net bindings.
>> 
>> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>> Signed-off-by: Felix Fietkau <nbd@nbd.name>
>> ---
>>  .../mediatek/mediatek,mt7622-pcie-mirror.yaml | 42 +++++++++++++++++++
>>  .../devicetree/bindings/net/mediatek-net.txt  |  2 +
>>  2 files changed, 44 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-pcie-mirror.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-pcie-mirror.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-pcie-mirror.yaml
>> new file mode 100644
>> index 000000000000..9fbeb626ab23
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-pcie-mirror.yaml
>> @@ -0,0 +1,42 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-pcie-mirror.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: MediaTek PCIE Mirror Controller for MT7622
>> +
>> +maintainers:
>> +  - Lorenzo Bianconi <lorenzo@kernel.org>
>> +  - Felix Fietkau <nbd@nbd.name>
>> +
>> +description:
>> +  The mediatek PCIE mirror provides a configuration interface for PCIE
>> +  controller on MT7622 soc.
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - mediatek,mt7622-pcie-mirror
>> +      - const: syscon
> 
> This doesn't sound like a syscon to me. Are there multiple clients or
> functions in this block? A 'syscon' property is not the only way to
> create a regmap if that's what you need.
It's used only by the WED code in the ethernet driver, but there are 
multiple WED instances and only a single pcie-mirror block containing 
configuration for them.

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
