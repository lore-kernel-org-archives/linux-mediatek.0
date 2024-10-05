Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57D0CFB42B
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Oct 2024 19:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/S92lqZ+xKzudktcR1TIbH6b3CrdaorM7C9RekZJKKg=; b=MvjTIDiqSUW+Vu
	N8j/JNTxaGYtPnNtiLwud++mI8saSn2qE6as3lIl9YZlfYlVwrxthq2emI0FZrnYdNOfVu1Q4LN2F
	glFKhpW2LgE2hKgEQtUDSNzIOhAJ4iuk8pUyVvTCaZMyljX/6e5CwRJyobynNj5DIVmog0V/j6jB6
	1GeJbHdYFfs5vZ8MzXmFDksbfL6q8yDpT3+nNBu1/px6UbAt6LDTSsVwH/qRUQ4KQ2qamS3a3EsaR
	suDvHqhFI925ul8Nik+kNViIR3edGR3rGKlO3GimkWQt1PvOSIKqguFIaAD63F7XrF9r29xuzZzbs
	4fTbi+SEjbWzpEO2B/+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxAfm-0000000FoYf-2Rug;
	Sat, 05 Oct 2024 19:42:38 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxAeU-0000000FoQa-2kKb;
	Sat, 05 Oct 2024 19:41:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1728157263; x=1728762063; i=frank-w@public-files.de;
	bh=/S92lqZ+xKzudktcR1TIbH6b3CrdaorM7C9RekZJKKg=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Rcq6fl2pxDHUtCy+uA1Pq9vOrpMZyxG5t9WbycQXnx1KEo59BEjpQ4vjZqcGLp1v
	 qseU5mOd+rwb4yxwzANLw+1idfg6EQWWkQyhLZjKi0XlC6l4UfqAqSOJo4uepLx+f
	 KOGsXbbcBBA7f0meuHNz5JS8I5LYDMTXDY5F8u88aREVN1X5dDdhychdxyt4X5Lgv
	 tPU6qL9mxFSSTQHB7DJNfg0F5E3zGtsZe9KMwlTDpeSXR5jUoXug3Q1n6Fzah+xq/
	 hh4Qx4Bnim7k97wPymCOR13f8ikjzVNGdfYL7dtIWTulq2PwQPlSbC6AfLlbScH2n
	 AKVXx7k8iUPycvi8kA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([157.180.224.66]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MNbox-1tLheG2EHL-00K4Qk; Sat, 05
 Oct 2024 21:41:03 +0200
Date: Sat, 05 Oct 2024 21:41:02 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: Rob Herring <robh@kernel.org>, Frank Wunderlich <linux@fw-web.de>
CC: Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sean Wang <sean.wang@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 daniel@makrotopia.org, john@phrozen.org, ansuelsmth@gmail.com,
 eladwf@gmail.com
Subject: Re: [PATCH v1 3/4] dt-bindings: pinctrl: add binding for MT7988 SoC
User-Agent: K-9 Mail for Android
In-Reply-To: <20241005184449.GA505893-robh@kernel.org>
References: <20241004123423.34519-1-linux@fw-web.de> <20241004123423.34519-4-linux@fw-web.de> <20241005184449.GA505893-robh@kernel.org>
Message-ID: <DA1815FE-D2A6-46A3-9219-9216A3C6D61A@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1udbzqpUdFVIpiIicrJzHxwKDVUEDEWlPS/trJexjGU2JwVQinR
 jcKUU1vqCkbp2yqhWSERVNkmY49KqrJiW0UesMFJuPin27oMEg6zeb9p7vXzmowGmAmgpb8
 WVVw3Zi9NFXoDOYUEJaOajBWTovF1v4KPjITrTZnQdcqMVloSz41ONTTyauwJ4rW2ZH5Z10
 zZiNL2ocf96lwcrRoYhCQ==
UI-OutboundReport: notjunk:1;M01:P0:Lm4FPeXICZQ=;WUM3CLu+SvTk5DI584TEBteumXK
 yASSxAJ2eu9xXpdntD1g05Ef47LQ+uLEANjrdHrje0gmwJZKHZvpEr9BhHTrlrbMmEpLM6ioE
 /KHW+QJ8hd5hM1rDZqttNLLpC71quoYe4Hg36F/6PucW4owRP+7TM0HgNl5Z3UatXA1jHNkiJ
 wBR85l4fEA7lLMk8/CgZ8jF8zSmFHkvkjgBqS5ijhXmM3+od/tY1O7D+cTCJLnhc69l8TAEmy
 sdFv7ZcmR4fAsMhFGpXusYT+GBK7gIdpWUhofMzKGYGP4aPfddYGDOmy4fNW6I7Lw0YQVkrXW
 yDkxCYCuYtHGfONiTNcNeHDFhSRsYvP3Lt/u+NkLjEcP1XrNapGGFiS20d1M1kVbGDrmf1osJ
 ctmSOiijyBBfXj0I+hABK4Jca9zARsuS6RAR/9Z93PKdwfgcEOgllZ8vor385l2FirCcoNvF7
 OuePPkJdt0m0R9hAuidmEQMZsq851vD/M3iz0BzxdXOxJSJ8sZpGqxmCZJNBe7BeDXYRmdKtx
 Qh88eeRTQdsqGZFpm3vkyq+55QHp2MqOPg8aQfQG33Bh0SDmMBDQJAGu5seZtjIdZKECOxUqA
 9Atsewvv8DB0BixgfrmS6PVUvSy+c82OgXLq8p1pDOTq0B5SfL4WXRkLMKgoPcdYF6XyNAA5B
 CnT6hdsrz3h471H4jUWx0/QA5VWX8AnUcJgmRqIDBMx2PzRS0w7cvazL8l58RSX46OVRP+UbY
 tfL3yopolckDaacpQ+0/Fgtch9cGDkVRkSrtP2ge09PDZR62yKXf+l2aCUUv8M3MJXLqGqEWV
 iNV+xswODDau9gGb1a240gxg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241005_124119_092757_5A2CB279 
X-CRM114-Status: UNSURE (   9.69  )
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
Reply-To: frank-w@public-files.de
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Rob

Thank you for first review

Am 5=2E Oktober 2024 20:44:49 MESZ schrieb Rob Herring <robh@kernel=2Eorg>=
:
>On Fri, Oct 04, 2024 at 02:34:17PM +0200, Frank Wunderlich wrote:

>> +patternProperties:
>> +  '-pins$':
>> +    type: object
>> +    additionalProperties: false
>> +
>> +    patternProperties:
>> +      '^=2E*mux=2E*$':
>
>Do you really need 'mux' anywhere in the name?
>
>> +        type: object
>> +        additionalProperties: false
>> +        description: |
>> +          pinmux configuration nodes=2E
=2E=2E=2E
>> +      '^=2E*conf=2E*$':
>
>Really need 'conf' anywhere in the name?=20
>
>> +        type: object
>> +        additionalProperties: false
>> +        description:
>> +          pinconf configuration nodes=2E
>> +        $ref: /schemas/pinctrl/pincfg-node=2Eyaml

mux and conf are used to match subnodes see example for mdio0_pins

mdio0_pins: mdio0-pins {
  mux {
    function =3D "eth";
    groups =3D "mdc_mdio0";
  };

  conf {
    pins =3D "SMI_0_MDC", "SMI_0_MDIO";
    drive-strength =3D <MTK_DRIVE_8mA>;
  };
};

This is same as done for previous SoC like mt7986=2E


regards Frank

