Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67599C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Oct 2022 15:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jt9NmyfGUJIYwUHCzEW8eHOdjWosSSdsIWzKAGgNkII=; b=wIbIbFywoCIuP3A61zEgiZJnEY
	L9p08i0QrRavB5HxvUN6uaSIU2rNnN8hYd2QMXlIrsoaqmarlGWYmbxOv+S7RgvdV0zMm9t5spgYc
	wTYi9xwSLfp+RmNDBc9tHio/YhcXhzkBCedvRi0CEfswwjX7zZQdkdrWFIQWYRsn70XKFtkaCkunI
	LxBeLPIw11YBbUwR1sy4qUWJums+IytbSy3a9NJdi4a9I7UINGR1z/XUJ4ak03MkQOWx0tcbAEhZa
	hLl/YhQeU+BvUfL4gt2bdon6kftHDFkb5U4s7e6kPhXbz5nt1wzfcGyWxHAPqzeOdMKvige4kAgTy
	hH3Ngkfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okooU-007vf7-Ng; Tue, 18 Oct 2022 15:47:30 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okom9-007tNA-8g; Tue, 18 Oct 2022 15:45:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1666107900;
	bh=Jt9NmyfGUJIYwUHCzEW8eHOdjWosSSdsIWzKAGgNkII=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=af4k8kmuydlKzRPaqGcg5kxLEtku1l3NBrtQiBu2TBbes+tESXccMaDzhjRcXAmWO
	 I0l2raeeldApHJXHqe+ikRsse1uMppCUMT0Nc1N4BkO8Fi0wvv4byyTP3h/1mT/oYe
	 6Zj51rAOvllZR7X6oyP/XvMffcaa4TiaUYwTgF9I=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.245.77.116] ([80.245.77.116]) by web-mail.gmx.net
 (3c-app-gmx-bap38.server.lan [172.19.172.108]) (via HTTP); Tue, 18 Oct 2022
 17:45:00 +0200
MIME-Version: 1.0
Message-ID: <trinity-8fe25643-9cf4-4f09-bebb-208570a540d4-1666107900051@3c-app-gmx-bap38>
From: Frank Wunderlich <frank-w@public-files.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Aw: Re: [RFC v1 02/12] dt-bindings: PCI: mediatek-gen3: add support
 for mt7986
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Oct 2022 17:45:00 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <684c5659-0691-6534-1602-6c0a53e6e503@linaro.org>
References: <20221017104141.7338-1-linux@fw-web.de>
 <20221017104141.7338-3-linux@fw-web.de>
 <684c5659-0691-6534-1602-6c0a53e6e503@linaro.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:PMOh3tpLUMdJNWND3roFSaz6NdXp/BM0p9g+fEsaYUCyloExNRoiqxoIPHwvPXVjpVM0z
 0B5l1TzUaZ0CvFNKNRCUuE8US/Xs1UjdwtXKEBnhpHWRHi68JRTvBJd7x1V+fd81vJ86syjRsTcs
 YEQjSw2iNQndlmMfMuZfUVauKCjVairtdw6kOemtuJiDNzarIhRNAOYNAwkHAA2koGgd/KINNjgt
 nsCz4Rpd8DBsU3vx7wS5H3k9CwMzPP9AkSmzbMQMCi6K3W2jl/6Vwj+c7VyhzNl8TXy3aNQgLYEf
 hI=
X-UI-Out-Filterresults: notjunk:1;V03:K0:G7hCPfXsN6k=:TmCjYiVy2SSY1kL8mfwEFj
 JFWGn2gp0L3NVnE9OVdn2BATvK+qouS+Okg3iLkffGumPDUGbZ2g19ZaLTb1FF5JdPGB8NSdJ
 e5vm/bYfhd8QrFCyYQ5KhCX2QGTK99urFaI1QAudQtmDh/w9vgUmbAQyB4LZZ2IX/Hiu5Sp8X
 kL90zQ5Brgn+/Os/+l7AmK6JuESqeYe0P3OsleBVo5zwMnzDephXKIMihGrCZS+ayvsqZ62XW
 46nZYR95XAcC7PA8pa0OaHEUDTvPYKRJ0J+TAwYoyNRvdp7VBx+3LlHSvII16ad6GGuZD/xvw
 geTwgsoWjkw1mJ1/Lgzvc4Lx+ycqWUGhYq5APrP6RiZfRwJV26dtZPtcAa9UEII9dQHE7wmK8
 HyDd+dIVoAWOwl5YtEAfl1c2YwwaG7lXLXM8QMnqEqzYyYvGXW16J7r9p8kqfyX6nIonrOJ6e
 bunYg+PGn/16CAqPc1ojiKVoQqwddIycVyPxbps4BTHqa5AKfe4PZTtdD23jHY88c+xBwEQmd
 Vx/FtPVepTWuLBlJywrqJ0wBVIHlAQtkq6Ni8ujbu8v47c41erwK1ZV81F1X1uRN4L9+e19+c
 K8d28j3OMMFwrLk6CN2uiGipWjRDNTAO6M4R/tg6xqjQXBJ0ey3LErS1HFO3R4oadeNg0XEPO
 yWKbCy5kNkRpRb2atxmQSBxBAiBYrJTzDM2qmXbdc13kWyH/DgthnXjPiBC7Ur3ofq+yZOb6E
 Cwpgxck+HkVRbFBn+Sr/heQjJq2ZOqpOkKqZsClqadiqTregIMqVeXRYYPjkBkjZMAq8JPz5w
 bOKk+Z2gwJQyR0BOH45XEvFIFQ6Y+aIFMB/azazxk7NT5vUHYrT+/5W81FDyjVeAv/bib/T4g
 F+yvK/zPR8f55bobu0NAggeEYm97FSvfl0iSZZmnNFRXL6CMq3clwDu5q7VrefUR5YoydGAQG
 VlTt7Fc8Pcc6paQDMkWm3woMxhLjtR7A06/C9SdGh4TCb5tDA/xt8tlx3DjSkTuDSaG0iy2KU
 Ope2usjZzJdeYbfK3iHJp4eskuL3LG0dNyPQar/Q85AG13JOIjDIjsvYGUJsATdhN721XF4k+
 tOFfqECcmqe10SCGKRGv/6xpFz9F/8eygo2TWz0rcddVZI8TvmCllUjgKWpkMKuvBn7D+A7tA
 /BgSORrCMk3HZQb8VwPXQBVpNA/+/+bfN8402Ug/VqaA1gn2swCwiUawi31pSizKwty0rXO5b
 kd+A+nCtluUwcnMiJ86TGv5xK9f7NrwgLMcAiTbuGOFdo4n3lcLN0zWRYWbFvcwNlpBpenlWg
 uWUWldxT
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_084505_639349_61B76968 
X-CRM114-Status: GOOD (  12.44  )
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

Hi,

> Gesendet: Dienstag, 18. Oktober 2022 um 17:35 Uhr
> Von: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>
> On 17/10/2022 06:41, Frank Wunderlich wrote:
> > From: Frank Wunderlich <frank-w@public-files.de>

> Maybe the clock is not required on mt7986?

yes, mt7986 does not have all clocks currently defined in binding for gen3=
-pcie (currently mt8xxx)

the mapping is as followed:

CLK_INFRA_IPCIER_CK: peri_26m
CLK_INFRA_IPCIEB_CK: top_133m
CLK_INFRA_IPCIE_CK: pcie working clock from SoC, in MT7986 it is equal to =
tl_26m + tl_96m + tl_32k in MT8192
CLK_INFRA_PCIE_SEL: clock mux to select source clock to CLK_INFRA_IPCIE_CK
CLK_INFRA_IPCIE_PIPE_CK : pcie working clock from PHY, pl_250m

as far as i see the driver only enables the clocks in bulk (no access to t=
he clock-names), but binding needs the names

got it solved with help from mtk (see my comment on part 7) with filling m=
issing clocks with a fixed-clock-node.
If this is the right way this binding-change is enough ;)

> Anyway, for the bindings:
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

thx

regards Frank

