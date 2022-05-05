Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD2BC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 09:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:From:CC:To:Subject
	:MIME-Version:References:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r17r9TxV1N7vF+N6HhbKlV4724SzTYZJGqS8U4bKaew=; b=rWFonzzJSg1720
	eNCdMZq/Lm+tgZh6OL7B6YJ5kLUWfp8fOCfX+diuwb+e5qKUXrskNmJXPTBfuwBnPlvCJm2VgjQYQ
	sc5dfZ1vfGd0ujH9VDMzGzaLq0TtnwrukjtKDBsdZhpuCYH/i23pFPzZajxZN2ydn+02fuRL7nLVD
	SL0UUTHOTPvBWWHg9KnPjL9OKAEvpdI7As2yj8kPlLOiG4M0er9UhrcsANsr+XSCRtgQFcP7FQyyQ
	EU6+vhEScVh1QnwffI+o2Fwu0DqT73exLCnB2rkQHxWR8/n1YIszFsK8nQzxeIEuAn4RqBvQ23Hdq
	ecOEDrAxd33BrkqrxY0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmXRi-00EvDF-Mu; Thu, 05 May 2022 09:06:50 +0000
Received: from mout.gmx.net ([212.227.17.21])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmXRe-00EvBG-FT; Thu, 05 May 2022 09:06:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1651741573;
 bh=PE49ljxOaJbEZXi8zE0UMbSilxTIkum0Hyl9KtNCWhk=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
 CC:From;
 b=VUzb45/7jJ0QvY1LxJ8fGd5PIAHk5tdZv7WCsWGN7HfaLTECfsZkWen2XvyKS2Gcj
 8kH0TsJ3fjICqkzk+WMAkUiLt9Bn1doMlT+h/XRlLyxtX+9DYHnXTl42I6LxeNibw+
 Z5m/D4xAVI5EUTEwdTqGLboOd5OI7EtfGKKkEX84=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from frank-s9 ([217.61.145.208]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MO9z7-1nSWYG34kz-00OWh0; Thu, 05
 May 2022 11:06:13 +0200
Date: Thu, 05 May 2022 11:06:05 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <313a5b2e-c571-a13f-3447-b1cd7200f4c9@linaro.org>
References: <20220430130347.15190-1-linux@fw-web.de>
 <20220430130347.15190-5-linux@fw-web.de>
 <20220504152450.cs2afa4hwkqp5b5m@skbuf>
 <trinity-9f557027-8e00-4a4a-bc19-bc576e163f7b-1651678399970@3c-app-gmx-bs42>
 <20220504154720.62cwrz7frjkjbb7u@skbuf>
 <313a5b2e-c571-a13f-3447-b1cd7200f4c9@linaro.org>
MIME-Version: 1.0
Subject: Re: [RFC v2 4/4] arm64: dts: rockchip: Add mt7531 dsa node to
 BPI-R2-Pro board
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vladimir Oltean <olteanv@gmail.com>
CC: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Sean Wang <sean.wang@mediatek.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Peter Geis <pgwipeout@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
From: Frank Wunderlich <frank-w@public-files.de>
Message-ID: <D201CE50-280C-4089-BB9F-053FEA28FE9A@public-files.de>
X-Provags-ID: V03:K1:fswHZVyF/lRZd8JVwCdyHBJTeHXeAmwGzgMDMSGIdz0hDXO4adf
 6DNQ7Hdu1vjFnafdsMjLokD96/xSHtW4P+JlwGF2ydVvccgeJQBGyVtf7/ZDzMAqCho34s6
 sqGM3PaZ3PFndCo6VMXLcocAJLEHxA55eeaTeLXVgZvDzQ8Eq5RrHCw/S+odtiUpd+qjGwv
 hU0vAPDjw5yIm6bXegJYA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:j9Ro5GzlgnE=:y3PubMXQ+/zpI4KYSQDupN
 oJQ4JRWONcKWVYZCKX5H33jQSFgLL0YuSvZjmf5jpfD9ZjxI1yRt3sXo5C6rRn34aoaYXcKP5
 /4H0dcXerNyfkv11BLsVwX2VgZQOxaQjNLpXLl3aGa3zNBYwqcSzz/EdExVhA9cuEf8sEgCfn
 0wnFgq+SwuViwDNEq/HpuRQQaFDuxy1QDlx+o2nvYr3Hz788H0tqJwVfEMaWelJU+mtfwaBe6
 NzkUsrZ2U2B9dvCi+VSuW/GkhIMUw1KQlWZ4UKCNFtJAZmcwrMSIxIFOvJPEwDUaXgtE10z50
 7Fiv/v8B6y2qiSGvW/ReSyVbVgmgZhe1YtU8E2XzI5TXrt7rFOQw87hJkp/crzLFShocXerQ7
 zm4WJks0YVv+1oltOdPUFIspJjubkzbv6XYiF6BdA+1CMEaKHrstBYrKXswB30nDsqcWhzjrw
 /kfzpB34G2xm9xqFsI5fuR9s77kfUsVeA4d6UFGAhBhHRaclbOsFaHtbFhSIhSHIwg9bwKVIh
 92vmwoTI+2PqW/yiSDF3TKfSwd/vsdlZzF0+C3hwSi8Ko6/PFLXSWUVCWgA6nexfzcs1aVEqx
 0I4/Z32mTAh00UsfdTLvjzeqkIgzoNRB74Sjxg+mFyaD/zrL38u74bF3LB109QcvBTTxYlG9y
 NKZZ0Zue4kRVXXJ6jMvnCicYjwWrdHSKgW4nTT6d0Q9LhQb0mHnA0HN/m+BJRQLa7q2oQQHKz
 0lwS8B3plWBqraGPjKNqjhvTh/56cN9zvWWnXKNGA62Iayo5NAHKrVcuLPVUF1JFtbX4RVL3+
 rYbffYZn8AWErO/QSmfeoOWLPRiCSw5iQs214Qy7h2QgFe2mQb+BXSiZxLW1fQag1q+c3QUwT
 JRy7cyct7nh15eyCpady/PJZVyrV2v1SdKAZz2u5iF4aPZfy1qvV5C/lyUwqqEz/Q3Uael2IP
 M5nkUJKzCP6lIJUeLYU0LtyfFwZAAF/cyKyNAcZ3UvmQ8Rh1OFJadwYuyxLyRXiP3Wi6XDTAT
 gia7QCQap4UUaPAopLvQFtwWb0Gm66A9uYYycp2oQfnUWkuMSVGRNbufUVlKGNuB9pIvr8uQE
 88aNqbN5kytPzg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_020646_882857_2BD48D65 
X-CRM114-Status: GOOD (  12.03  )
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
Reply-To: frank-w@public-files.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Am 5. Mai 2022 10:46:55 MESZ schrieb Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>:
>On 04/05/2022 17:47, Vladimir Oltean wrote:
>>>
>>> current device-tree nodes using "switch" and "ports"
>>>
>>> see discussioon here about make it fixed to "ports" property instead
>of PatternProperties including optional "ethernet-"
>>>
>>>
>https://patchwork.kernel.org/project/linux-mediatek/patch/20220502153238.85090-1-linux@fw-web.de/#24843155
>> 
>> Hmm, I don't get why Krzysztof said to just keep what is used in
>> existing device trees. The schema validator should describe what is
>> valid, 
>
>These were talks about bindings which describe hardware. The node name,
>except Devicetree spec asking for generic names, does not matter here
>actually.
>
>> and since the mt7530 driver does not care one way or another
>> (some drivers do explicitly parse the "ports"/"ethernet-ports" node),
>> then whatever is valid for the DSA core is also valid for the mt7530
>> bindings. And "ethernet-ports" is valid too, so I think it should be
>> accepted by mediatek.yaml...
>
>You can make it "(ethernet-)?ports" as well. My comment was purely to
>make it simpler, for bindings (goes into properties, not
>patternProperties) and for us. If you prefer to keep it like DSA core,
>also fine.

Ok, i'm also thinking, the dsa-definition will be the right way (pattern-properties with optional "ethernet-") in binding.

Should i use "ethernet-ports" instead of "ports" here? Current dts with mt7530/mt7531 switches using "ports" so i would use it here too. If dsa prefer ethernet-ports now it should be changed in other files too.

>Best regards,
>Krzysztof

Hi,
regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
