Return-Path: <SRS0=12Pn=BT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 896B5C433E0
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2020 07:27:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DCF5206C0
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2020 07:27:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WJ7H8vUf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="QaZs8inF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DCF5206C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:From:To:Subject:MIME-Version:References:
	In-Reply-To:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KiNgy0XjjbKy5P7hMlUtwB8+NRthl2pKIF/g2pfqB94=; b=WJ7H8vUfGFP4Hx+Lxy62RiMnuu
	AXQfyU5FEn0CIiDqVV1YgEHZFAWPzxgf8ELDL77/h4fqVAhArp5d49vO2nH39VgIVx32MtRG8tTOB
	RaSKl2/gLLFuK6zV6nY5dS5fNoj5SX42cYSs8QSFihwEpeSBKNfu31vZNuMJBmuo0MpYwMuQDjD5c
	y8JIs1i3XM9b5T+EvM7p2zEhIu7/IxwI5X1bI9+nZB+2VdSf0pLpqS7a0Ba+Dhra013rWIfr7NtUi
	0RRF/VVfwQyASK7/gz/y0hZqOepOGiqBLVXaR8eVrJUWpXq3B3QLOsHQbzWEtgEn50DCMkRpdRk5R
	W79hdt6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k4fkC-0005MA-4r; Sun, 09 Aug 2020 07:27:48 +0000
Received: from mout.gmx.net ([212.227.15.18])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k4fk9-0005Ln-7n; Sun, 09 Aug 2020 07:27:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1596958061;
 bh=Ufa1u1M+5bfMDK9Ye7gYRHBggJJfXwVAm6B1GwwGHn0=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
 CC:From;
 b=QaZs8inFn4GzvHM9ONNbr05bOj9fmvprgvw0GHm/1jMr//oDtr8mOr1TtGl1aTRxo
 A9BApP/8N3EDNdA/BWVsqpMtx4stPajIMDOUa7XiWoPU4QMPxMSIm2x9yAMnZjntbV
 TMqidUxbcSb+FmYO/MD+B2RQhY8tvipVZlF/WtF4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from frank-s9 ([217.61.157.211]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MwQT9-1ku1OI3gc1-00sNVR; Sun, 09
 Aug 2020 09:22:12 +0200
Date: Sun, 09 Aug 2020 09:21:37 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <CAAOTY_9o_hBWxWBdDoeeJ6zuV4rb4R_yEoN5+L0uHBGMw4Kduw@mail.gmail.com>
References: <20200807082754.6790-1-linux@fw-web.de>
 <20200807082754.6790-2-linux@fw-web.de>
 <trinity-f5a5deb1-c123-44d7-b7ca-1f7a8dbe1c1c-1596889651064@3c-app-gmx-bap69>
 <CAAOTY_9o_hBWxWBdDoeeJ6zuV4rb4R_yEoN5+L0uHBGMw4Kduw@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] arm: dts: mt7623: move more display-related nodes to
 mt7623n.dtsi
To: linux-mediatek@lists.infradead.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>
From: Frank Wunderlich <frank-w@public-files.de>
Message-ID: <81DFA743-B455-498F-B2F2-161DD9D51F57@public-files.de>
X-Provags-ID: V03:K1:n2qOhvlM6adm2ED7/EAyQ9chstcoSUaBCZ6wyxFwFq1RLFhTUfN
 JDFDMl3ZckGfptmX8EU7AWQ5a/C5hfkiCJcgo5CYN1C2VLc/SvVXPD92osy8F6WnQzX0p6y
 l1VZ0dlWhqt4KFi7bhGjuMIACuBFx1fEsKbMyCjE9HAasMx3UhhcXbeZbuIZLdgeynxXGXa
 Qhwd1J0BrPeTGElNAOS6g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tv0/+PfIRJw=:ooHFRPzPCalT+o+npkP45y
 E92INUL2ya94+kqRg3TW2KnYLDCMX9oR9gCD5NpJ12Fd3UrZMOJY5zxA4LA8arki7xXVN+fia
 HtJzz1tzQIAppbnAKlZ7n6sljjGqUR0rroNqrnOB265HNULQ0F27bo5ikFJsFzW8ow3GhXRH7
 sVrOggNwgDeEtQCKy0LqTl7v5jZS0lK9NLxI5IrqpcKcb0HkkVAgsWxgjePI5CaJmxtwAT22o
 rTor73dcWzmvnIPt4XeFlE4zQhKdwYEXwF7nO8FDvm34ZmC86zxiXZxW0bB2AvW04/BJIh086
 q3MWcLnv0fiKjRqAzRJfKxdacArdzxGgFr7tVgtnPR4p7l/bN4nvD9YDoTUShJZzJZ7AnvFCx
 i4i4xE4A/9HVs1xwJCjz6Sjxij7xkLveMUjBFYomSDH7MggNyQLycVAOxZ3SyFU0XncCUwbk0
 09d1u9yyXjlefKVygBbbu+Sc0Wfpw6VX3lJe/zwhG+dfIE19QmienrTy1jogqP0NXki4TAqJc
 SIlfMtj6qJSCc+BgedSDm0quvWALxUbia2U6cubTYAeO4LqYFPeTR4Axi46dkYRXYW/IOSZU6
 75K9LH1oQtVZrJOm1oUuqF6em6lgiylClkbFiC//WtjnaS7wWDqHbyLuVuMv+yOWqSvKoGKf9
 i6JX5bgVLaJYSBXr7Fupd+ckMaGfPu519/jK+tNjxx+ufeWRtiftuYIJkHM8dYNYQZFfPzFw9
 pBJ3IfDuyyT/f+NiiFUfeuYuOepTsygEpfYn2LzU3Mn8jedBEWkNTki2GWjnbJA2TKK1pXyKq
 yIyCqeC0V7A+1c0yMZ/9ycRzSZ1DI/dNDE174UroebgxWvmPy94QrT8I8ZeAz4zgO111nsWj+
 L9etRo0tkgi82Eo+SVHjz1zlTXNPE+lC27qxuX0/lfgH3flMR+wph6+Es9H9BRAnssRrbFFxV
 GqQfGL/KJhJfhGE1M90YcK8MnBfqcQX+30VTYOUQFTybdeF0BznBF+voDIY7eJLZ4gRUhvvlK
 vhHko0jxLoYjVLoRi44Orph8EM32QsM330FXcjAlEInTItB6ZMQXq8hSPjB46WX3aMY2RHaWE
 iwQrSjH+f88LqJxmWA2Qv1gaueJcLB78eJI6UTIiIPygQYBpJLxcFPHFF7ZL9ZkmzkdEXwQZU
 jGoiGbueiSDH1RxMVQtDxVJBRa1zLbdrvbr8b8nd8MgHN3ehr4UUiauLpO2hTNioagZ/iYXFc
 ZFBVseD/AXzoCMh0Kdb6LQ82nbHLJIYA9riCy2A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200809_032745_589403_47626D35 
X-CRM114-Status: GOOD (  10.57  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 chunkuang Hu <chunkuang.hu@kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Frank Wunderlich <linux@fw-web.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



Am 9. August 2020 02:16:59 MESZ schrieb Chun-Kuang Hu <chunkuang.hu@kernel.org>:
>
>I would like to put all device in mt7623.dtsi with some device's
>status is "disabled" and change its status in platform dtsi.
>I would like to see all device in mt7623.dtsi because of its name. If
>you move some device to platform dtsi, we would trace all platform
>dtsi to find out how many device in mt7623. One day a new platform
>enable different devices, you would reorganize all these platform
>dtsi?

Ok,then i change the dts-patch from hdmi-series to disable all nodes and enabling them in bpi-r2 dts. Do they need to be in alphabetical order (or any other)?

Is the tmds Patch ok? (because review missing) https://patchwork.kernel.org/patch/11700679/

Just to know before reposting series as v5 :)
regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
