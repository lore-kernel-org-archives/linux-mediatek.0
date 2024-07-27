Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BE3C3DA61
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Jul 2024 12:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eLEYHa+txvP+ORLO1DCQFTF3C165+1lS1YxZqje5J3A=; b=UyVBt1FYMUJweYF9YvZBvYdTtR
	tPczSpcsAuiJUsbMafwKEDNcV2ZijYCjlfCdGmoRS3zHbE2vOaL0QuJljI8ADp+gNQ7OCG2gSLR+E
	xbc85IyPDAROPwIk4namvplZbvyhxPSEE6ckEw5qdT9tzWNEXzpA4fUg8uoWonzk1n5yJP4YyvKFQ
	E6eZi4qohbpLEJ8lrX61rq++BACZSF3CNa0M1Tturi89Udyb7qwIPyZBv/Z2Nu9nRXnPI2qqQim8E
	W67sMoiZIf+frpPDvNM2BYwA9ENhfhoqqE/kh29ske3+ik5jTE/6iUFJSckEleW6fJR6GrD667w5E
	PeHXcoQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXgEf-00000006eha-0baQ;
	Sat, 27 Jul 2024 12:09:17 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXgEc-00000006eh4-0Moa;
	Sat, 27 Jul 2024 12:09:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1722082135; x=1722686935; i=frank-w@public-files.de;
	bh=eLEYHa+txvP+ORLO1DCQFTF3C165+1lS1YxZqje5J3A=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=tOILh6snPTqW9mFqqm1CrUJLwTATYXkQ8Hr8kNRzyhFdnEQ24kzQKr6HbZqgpSNn
	 IwDYtU/3s3YMjrpw57f04vChsEDyap+5O564IMtVrfkwE4T1+SICXINbnLLre8yWH
	 dzxA2jwLhZvRN6JoYmZOf4cjNyNw/G/Idh5lsNSZubwcEsDScpLMvmG+k9J30kn8i
	 qM+XlOlhawYZLkOyQP8T5JYTgyhWqJ6yNmpyUUy7S6O2/ccMBaaHFCDYOO13oAbKW
	 +QqBiAtSJy/enTRpH4FXqK7vyXwQi53K0hmcY5HvT9qyskuNV/lGJFEsTrVPJJvle
	 gHIvA2KX+jq0dSH8zg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [80.245.78.50] ([80.245.78.50]) by web-mail.gmx.net
 (3c-app-gmx-bs28.server.lan [172.19.170.80]) (via HTTP); Sat, 27 Jul 2024
 14:08:54 +0200
MIME-Version: 1.0
Message-ID: <trinity-3bc6fc80-e245-4691-9a57-f021b080d070-1722082134917@3c-app-gmx-bs28>
From: Frank Wunderlich <frank-w@public-files.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Golle <daniel@makrotopia.org>, John Crispin <john@phrozen.org>,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Aw: Re: mt7988 usb broken on 6.10
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Jul 2024 14:08:54 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <2024072712-paralyze-overthrow-ea04@gregkh>
References: <trinity-c8e0af34-2704-476a-9454-bf5001256eb9-1722013999541@3c-app-gmx-bap12>
 <2024072712-paralyze-overthrow-ea04@gregkh>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:CbCz3z3Lqvb4tz8Jopzw/pM4eonOQHsnprkPdh8Mmb3zZxcFK2f79E781zfvABNzOVK4S
 fqKGamZYtuFniMTxLY8iZJwgGMI3oATZDiujaUlFv0tg9D9aOnJdrS8LX9X1OZtsvXoI4XafDYzi
 FTErfxAGxzb7uX59A6NP4GYyP7ZBU33mxk2GcrEH2yBY0a9KmxpAO6Mb7CRZQrTnBRSIvDM2ZX9q
 TZWujumc3WuVUblaPvXvJw86T5fFSJYpRiogWcOFwvyY4LZW6sas+q+2tiSCG1lLcDZmyxQtbBb2
 9Y=
UI-OutboundReport: notjunk:1;M01:P0:LE2+ll9mjvg=;GoNkjmUw+Zn4trXBKg3J5Pz0lA2
 wa3IIY91QoDY6VA6IHvvk2tKwKYIQdEVYCB0iuRCGiKFTSkInXLpR/NeFNSf+IVZtP/b7uhsP
 JVPSAtvjGrADvle5DUsoyww91Pup6ymhdaHhIv7bPZowbniF4/nEqc8iWoUeLdum2BEuQfEun
 e9fOvQgkTYzT7MpKIz12d+3gpSO3lWJBeDezf5ZkgrTjYeILtWxUb7HLbyc2ea0quR3V8JEVo
 S2UmdygXtjHpaJwUM/o49EcD98EHVISY8yaPUsgSJaEGpmxOgYjmqPQARRNvYU65+M1CqVD/A
 bodWYA4dpu9EnSjr3RRU23vj+jfZcD26t5zl+sxI2ndA1LAs8dT/2mZMYawnq1RSRTLnU/4X/
 1FkK8XKJX22fLbFO4SYRDtws9NQyty9L05bJosPOGA2ykXmA1ptHdHbO8FB5+22pq9l7Q92h2
 m3NlJrs8LOqxnXv92OOVlPCvrmbkoiMXiwVNXwJH7f+oK/rm+axDH9Z/ZgoLXLCgj0VYkd3in
 LQ3SkLNbhUJAGVEPPaGen5ToMxX2UXLfcsUMD8anARJpXH2dyVJx3nn7xZ3rby5GZkJXeu6je
 gSbGW63jhryav6h2tBjeusIA6hLfS+NNMlMQVNtQDno5ja8wi19k8MZbgCnlsZG6qOz4Y7G44
 b7C1/cMZYtiD18LAmNDFxUm3tUzbicYTI6FXewFfvQ==
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240727_050914_437276_B18995EA 
X-CRM114-Status: GOOD (  15.14  )
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

Hi

> Gesendet: Samstag, 27. Juli 2024 um 06:57 Uhr
> Von: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
> An: "Frank Wunderlich" <frank-w@public-files.de>
> Cc: "Mathias Nyman" <mathias.nyman@intel.com>, "Chunfeng Yun" <chunfeng.=
yun@mediatek.com>, "Matthias Brugger" <matthias.bgg@gmail.com>, "AngeloGio=
acchino Del Regno" <angelogioacchino.delregno@collabora.com>, "Daniel Goll=
e" <daniel@makrotopia.org>, "John Crispin" <john@phrozen.org>, linux-usb@v=
ger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists=
.infradead.org, linux-kernel@vger.kernel.org
> Betreff: Re: mt7988 usb broken on 6.10
>
> On Fri, Jul 26, 2024 at 07:13:19PM +0200, Frank Wunderlich wrote:
> > Hi,
> >
> > i've noticed that usb on mt7988 is broken in 6.10, was working on 6.9 =
(with some additional patches like
> > for pinctrl and dts as this chipset is not completely supported by mai=
nline yet).
>
> Any chance you can use 'git bisect' to track down the offending commit?

because in mainline there is much missing for this SoC/board bisect is a b=
it tricky, so i tried to find someone which can say this error can be caus=
ed by a limited set of changes so i could simply revert some suspicious co=
mmits.

But i found out that we had some major differences in the usb devicetree n=
odes i have not expected (and to be honest not checked prior to posting). =
After using same dts like in 6.9 all is good, sorry for the noise.

> thanks,
>
> greg k-h


regards Frank

