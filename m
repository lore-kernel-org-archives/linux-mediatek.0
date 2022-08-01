Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB31C19F2B
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Aug 2022 17:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0dGf0wQlT5nVscla096RlUxod41IYCPpARZuBEndXgw=; b=KBHLmVuVZ3p2CeXtFCWQHNlJjq
	2/SW7IbtTz6eMDTLyIaJVE+I1+hzhQcqEhrfaYzHNK+fjHXSwRO9dhBfEiqbsFPdl/p3oGGgp50Fc
	FTcvN2ogWGfPXQbRpu/GqPGssojrNAE1QZ4k0PsZBAu3ond1Sg7/hSCM95L1UVlbcp77w+C3M9W2x
	xHDvkIoX46FmB4m1UcgAXiNFhR8gzYQnZmzC4ZaEwP042qOr8YSycyu8/t2EY6l5mufVop2Zqd31R
	yldU8uO6pOGmNn18axMmcLCbnHdI86jPE7VpjJhWRpRYZ0KLpvtDuqjgCpjUU3eD1rh+bGS2JwYHE
	goSedKGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIZdE-008PYX-8o; Mon, 01 Aug 2022 17:55:08 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIZdB-008PS4-5s
	for linux-mediatek@lists.infradead.org; Mon, 01 Aug 2022 17:55:06 +0000
Received: by mail-lf1-x12e.google.com with SMTP id t22so18521165lfg.1
        for <linux-mediatek@lists.infradead.org>; Mon, 01 Aug 2022 10:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=0dGf0wQlT5nVscla096RlUxod41IYCPpARZuBEndXgw=;
        b=T6Yc3nNefe3TyXG0Vbq3cLSHdoLWMnMoLC1rCsAkOgbXk6qxf5NxTtsWLdlh+h8h+Y
         zy2IwEG5thASc8/tliCDThGrGmtCTEdm8IXEBOHigiClrMlsAzwm83kX6UzZ765pOx1e
         OclAzmznuvZ754z0Ve0hY1GPZHIA1OlVcjqd1pdshqzyg6rGVUId1LPHhOz3KeyYZFRc
         t/OHO6Ha6Awj4xVLh6Z29b7VRFpOctOrXQjlHsrwl4Qf09vAHD3rLXe3d64GSOjqOUXp
         pxqPLGY1Wx82yKUx05QB3V6cu+EFy6fNjGcOecN3bN3HXJRhuRdVTt0iyNgPggTgQqgE
         58kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0dGf0wQlT5nVscla096RlUxod41IYCPpARZuBEndXgw=;
        b=Aq/3VEmXPYTluNuqkFYqTkE1OnBmjxo+jwVvj+5OxVYZTbpHcj7KO4QtbcBPAEHGt4
         jfAbkI5CY6zyOkyxit7/1GiueCCM4V80nDu0WsQtWGxNzwY0sqXlHqDLOV3sZRsks/td
         AR2pGZ2tdrIKaxjz9dHr9uXVyD7g8L9qbDkmc02FOLLe4JcNkzuV5mLfqb6w2iHOLs3M
         Pen7JNbjCZgThG67aSxoeGuJHcO9LjsEz0sgYEpxy0mSGY1G77+/gYBQhYvnxxxc6xqw
         veD5o5bgT9smgC9Hy38ndZbvQT4FrvgI3xSjGVTFjV/nTq/FTM96c3t38kavuZEPO4aF
         eRbw==
X-Gm-Message-State: AJIora/ITKamxImAaWCuyO9Pv1gYQV6uVkOU0k0iHm9LWKU821IlFkXz
	E6dr+qzL9rvCSXgbf8FC114xRg==
X-Google-Smtp-Source: AGRyM1sQPJdZYAWXfwoVj4Hz7Z7Cwylr4YwG9UFSXMVERZh0c/cbramPGiv0H/4T1qlznG/Ilz5Rxw==
X-Received: by 2002:ac2:4a8f:0:b0:48a:9705:c81d with SMTP id l15-20020ac24a8f000000b0048a9705c81dmr5760708lfp.63.1659376498624;
        Mon, 01 Aug 2022 10:54:58 -0700 (PDT)
Received: from [192.168.1.6] ([213.161.169.44])
        by smtp.gmail.com with ESMTPSA id bj38-20020a2eaaa6000000b0025d64453f4dsm1654422ljb.122.2022.08.01.10.54.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Aug 2022 10:54:57 -0700 (PDT)
Message-ID: <428fe2c1-3c70-5ae8-efcb-1e4a0426a972@linaro.org>
Date: Mon, 1 Aug 2022 19:54:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [RFC PATCH net-next] dt-bindings: net: dsa: mediatek,mt7530:
 completely rework binding
Content-Language: en-US
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
 <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Frank Wunderlich
 <frank-w@public-files.de>, Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Sander Vanheule <sander@svanheule.net>,
 =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>,
 Daniel Golle <daniel@makrotopia.org>, erkin.bozoglu@xeront.com,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220726122406.31043-1-arinc.unal@arinc9.com>
 <a8c778db-f52c-45cb-c671-556b24f3cb46@linaro.org>
 <a2dd1ce2-a23e-8894-5ef4-b73ef0dad89d@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a2dd1ce2-a23e-8894-5ef4-b73ef0dad89d@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220801_105505_314978_257200E5 
X-CRM114-Status: GOOD (  14.64  )
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

On 30/07/2022 10:24, Arınç ÜNAL wrote:
> Hi Krzysztof,
> 
> On 27.07.2022 13:29, Krzysztof Kozlowski wrote:
>> On 26/07/2022 14:24, Arınç ÜNAL wrote:
>>> Completely rework the binding for MediaTek MT7530 and MT7531 switches.
>>
>> Rules are the same for schema as for driver - one patch, one thing. You
>> mix here trivial style changes (removal of quotes) with functional stuff.
>>
>> Patch is unreviewable, so it must be split.
> 
> Thank you. I'm going to split it this way:
> - Trivial changes; fix title and property descriptions, remove quotes, 
> add me as maintainer, etc.
> - Update binding description
> - Update json-schema for compatible devices
> - Update examples
> 
> Let me know if you have any objections.


Depends what are these "udpates". One logical change = one patch. Adding
compatible in one patch and then adding example for it, is not correct.


Best regards,
Krzysztof

