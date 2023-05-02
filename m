Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1736C77B73
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 May 2023 18:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h5KPY5V6nk7zcKsejg06UhQdXAoI4rxf/Iee2Sdzh0s=; b=gxWyuCy8XMuKTe
	xKVIWPqqzQiIO5Piu4XHyL8WBdQstOBvn2l2PJqL2DLml2jNTxfUGcoQw/97tkzmZpDMxFHjpiJWC
	7fXTcFHQPyKfwmxIHwZGBzR7TmkAgN1blHA0pC4z2z4iXRY2r52hOkWanPzf9KHmvSUbQqmIiN0sH
	OkQI/Ged8IoIM8xFP5vRqRSZ5bjc4ys9AK0YMml21rrLwMT2+8MmZFCaWlWVs/yJ0Z0kXAnXuSDkO
	E+P/SkX5/3XTTXQ2WEbuCtnvUPczBacNApTM0opegtvjCm5bR1r8ND6xSqPo3rLThu6zEkBkJnlxy
	IOP/f2WXIV7iHOX08ZhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptulx-002MxW-0h;
	Tue, 02 May 2023 18:30:45 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptult-002Mvr-2A;
	Tue, 02 May 2023 18:30:42 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-3ef2f81a96cso42219351cf.0;
        Tue, 02 May 2023 11:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683052239; x=1685644239;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h5KPY5V6nk7zcKsejg06UhQdXAoI4rxf/Iee2Sdzh0s=;
        b=huvapiP1o/a5ROF+RrV3LRzVcl8VvchFqlWxmMyY0NsJlusefbB0XvV8hgh3gac6fo
         fqGq1g63D/En+ZAO6WAdGfLrFNH9C8RkAXnoKz2h9frRYIYjUPjRKoSrewvawZIe/GG/
         ywI+pevRMWLaUqjPPy8faM0HkoJhrfxh3gDXhnwhl8jh99aaADOFeVogqj308IH7+KGj
         1tB3pTQayl8TKnvnR1TsUmh88QYiKArDHl+PDtBEJl5XwAdv5GIkXirh1H64z4cEEal5
         zCd8qPqpJ3raiW4C26zqSdD9DXeozCbVKNWuSNT+FmQiS7tddDCkih+UGCBgft+8QE/b
         Acvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683052239; x=1685644239;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h5KPY5V6nk7zcKsejg06UhQdXAoI4rxf/Iee2Sdzh0s=;
        b=JBPluCWtNlIyFzJTwOaBkztwgqh/LyEh/Nl9CNmVg2+DyKIIvUWx98RlWee3KAF6jM
         esmrIfhA3CbX9EVF+3yTqxgDPsbsUzLyJTv1dHGbQnVXnSkLuVRP185znTiyHZAsAfEb
         uh8SH1EOXNPdr0lZCYPX3uaeFrY9zCpwV7kmF09R/7hl4omTmGWyideI/UJQzbhUR4Og
         8/agymeePrrTsBhniyap5ae0K7Rm587uhZx3OQsEYgEw37LEvpIF98kzDTgbayU36CW+
         bajxRULYsXw6FfDrdRMIv/TL7olpMdbqyV4yKMFSfl2EHkZxWkr1Hjug+1Vol9mRECNg
         6IhQ==
X-Gm-Message-State: AC+VfDz2h57FMaISCk2wqLlrWKZdhsr4SDFTgqwf/4sn8zAKaFYWz6lF
	NCI+CyXbDoq/GF6Y6ruH5JA=
X-Google-Smtp-Source: ACHHUZ4cr3QjY4+z+dN7SsjEHvHkOPquQGdAxCy3mXR0QlFgJ/dhUGxFG6VteZXVkN2h21ws6YF9/A==
X-Received: by 2002:ac8:5a8b:0:b0:3ef:327d:ac78 with SMTP id c11-20020ac85a8b000000b003ef327dac78mr25703066qtc.36.1683052239136;
        Tue, 02 May 2023 11:30:39 -0700 (PDT)
Received: from [10.69.71.131] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id c136-20020ae9ed8e000000b007468b183a65sm9918474qkg.30.2023.05.02.11.30.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 11:30:38 -0700 (PDT)
Message-ID: <5e00b4c7-8d3f-e1b2-4359-5ee8fdf92ea9@gmail.com>
Date: Tue, 2 May 2023 11:30:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH net 2/2] net: dsa: mt7530: fix network connectivity with
 multiple CPU ports
Content-Language: en-US
To: arinc9.unal@gmail.com, Sean Wang <sean.wang@mediatek.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>
References: <20230501121538.57968-1-arinc.unal@arinc9.com>
 <20230501121538.57968-2-arinc.unal@arinc9.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230501121538.57968-2-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_113041_707443_C64D5008 
X-CRM114-Status: GOOD (  12.60  )
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
Cc: erkin.bozoglu@xeront.com, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org, mithat.guner@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 5/1/2023 5:15 AM, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> On mt753x_cpu_port_enable() there's code that enables flooding for the CPU
> port only. Since mt753x_cpu_port_enable() runs twice when both CPU ports
> are enabled, port 6 becomes the only port to forward the frames to. But
> port 5 is the active port, so no frames received from the user ports will
> be forwarded to port 5 which breaks network connectivity.
> 
> Every bit of the BC_FFP, UNM_FFP, and UNU_FFP bits represents a port. Fix
> this issue by setting the bit that corresponds to the CPU port without
> overwriting the other bits.
> 
> Clear the bits beforehand only for the MT7531 switch. According to the
> documents MT7621 Giga Switch Programming Guide v0.3 and MT7531 Reference
> Manual for Development Board v1.0, after reset, the BC_FFP, UNM_FFP, and
> UNU_FFP bits are set to 1 for MT7531, 0 for MT7530.
> 
> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>

This tag is implied by your Signed-off-by tag. No Fixes tag for this one?
-- 
Florian

