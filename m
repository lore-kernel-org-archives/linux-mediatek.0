Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F103C4829D
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Feb 2024 10:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+CYWLn2IiAH5mXLQN9lGQyrLbT4HP2FHCy8MSCdo6U=; b=e8owIY7o3LZBQL2JAl3H+K9YIG
	muD9dvDxkaR+6CQGdYlV2Ei9D/dvUQnlZCHXA+zZncCMk7smxkhibGp0eg1/zBsRXmJq6rSOS/OCW
	aYTHrCSjHK5iA5GTmAK3U2mjVE92/TKOxjgBdq3FahHUbQtacM2xcGENTipk1nYVmKEsIjT+eCSnf
	xvFAvk2bNT11E7ECthvW3bJ3/i+9PMsyiTrz1V7Jo2jZLqSoB65/SOwTJPq2Wz+rOysmcdp0DcpKr
	VKFI/51AQyd2qmZ4WOcrkCa6LHBfCGf95fGszvDeV6m1AAmyTIOV8cpNvY0vR+zwASR7hc9kSW/M2
	iifNZSQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXIj0-00000007344-05YY;
	Tue, 06 Feb 2024 10:30:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXHeA-00000006g4K-3ZIU;
	Tue, 06 Feb 2024 09:21:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=b+CYWLn2IiAH5mXLQN9lGQyrLbT4HP2FHCy8MSCdo6U=; b=f5f/yxo1RNBmWssguWATWkpmo0
	1Tyz1hywnXlm+CyhW9Y/Idi+J97rm1pSzJ+5ayhWLVLPOosiu4+gdGI4JIb3JFK0Fj+w1rD4zv7ps
	dlmANf1TeAl0/Jxeci42xJIS0QQV/L6LRQOta95J7yXRv7FQ8pxtLhVhzI+uZr8uRGc0WrVx9uElR
	2/x0qaupVz75wZO9qzRbjDKHkWIeCuWYjrbcW3DpRHrsMzIuhD/SrznPYVC3dMrF98n28UPcJD5OK
	Y4N7xa5Y27DJzcm8rH9lemOTLfLOMXXbzekECZy1FtnVtOgK5i7p5G/JqIp0GqOGVrepJVY3MExJK
	JT79GN7A==;
Received: from mout.web.de ([212.227.15.4])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXHe6-0000000CQuJ-3AZ6;
	Tue, 06 Feb 2024 09:21:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1707211287; x=1707816087; i=markus.elfring@web.de;
	bh=Z0EJLNfhbuuNB4ZK6fiRLpTdMpGVb/m6FT+YnPWA8Os=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=f5L8NiUBgNX8Uipf3MwDtARtbv6cRF7eDe2ikchGVv2MsHSksTRuPfnIaJ89BMKk
	 N+nBe6B/TPoQrXEROxlb+rNxoBUHrGGwpfVQE1ntv10RtX++jKXtg66d1TnDy4gq8
	 QDNooBWppCH/5z2gcXo2UHDKHm/JO4D4swYW95r3+ufxbOE+wL6+PXqpzkC10EX7J
	 ZFqmYaIPIfUxME4KTomKW8M/Ca6ioUI4FIHoAdJu1DGey59KKSaUjGLTL0oFmZo6R
	 U79N3m1FjmanDGlJH6cnUQwxoZ+6hkNP1yR9DQtshnOtiB3LJWH4A23gvsJfS3rQi
	 gnpqNN6GwNbCQGQ8vg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MjxeO-1r8uC738hs-00kep7; Tue, 06
 Feb 2024 10:21:27 +0100
Message-ID: <6e397bf2-1d45-434f-8619-58a737a138e3@web.de>
Date: Tue, 6 Feb 2024 10:21:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2] pmdomain: mediatek: Use devm_platform_ioremap_resource()
 in init_scp()
Content-Language: en-GB
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
References: <da6af483-5ee9-45cd-922e-d9d5364674dc@web.de>
 <CAMuHMdUxn4Ne7kmEfONz8Uk3Why3m9r83GdM5RzTxm_4Gj_a6g@mail.gmail.com>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <CAMuHMdUxn4Ne7kmEfONz8Uk3Why3m9r83GdM5RzTxm_4Gj_a6g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sIgkR6RZholr8f23reVbxTGlh3vc3TB9Xak75+eYK+SHo4A2Dyf
 2VHa6jkH4tMwyR4rmkEM2xlTZT8ZDWE2/x2TOte++WTx3+PSt29kdt1f5i3Or/8NGH0whyz
 LqP6PhelcgvmsvplzqryLSzP5LvRY81PrsMeD6CKGNlFvHTqZ/LSU+ouMbAw3LD93PwkEk0
 RFUNWcvPjWNhBI3dWK8Ew==
UI-OutboundReport: notjunk:1;M01:P0:abdyAH2ZPBU=;QCSFV8TEkFa488xf+eC1ys85/0j
 xj2oAxsznVBHos30HaNxlG6WkB9oK4YyBAzNZbpHrYpQeqQM7hpH8BazIAYAN/AM0veztM5Lp
 USMpYz22I46Tonr7B7atTqiHJ2SwiHD7YglNQ2RSR9LWTWU1xMQlVGXQRNGA7XN2niFmfouut
 bF6KC5I7cZxjFP3w1TMN4aHRTrFAnsrAyQKhMfHNB6xuwx3jLb9ADjryNTfO0gEQPP0mxNYPM
 9RlH6kaYkPddOd9yQFA9lWaUoWfC/1ca20KiW80wHHbHgXWZLgIY7ubPVj0zEfT/Ta0LlWqtr
 1MxM6/UiGytFicpFEr5mw6EQ03UQ9WwJ5itNgxScOdfMRqDQS2XyI3+qBS21VmL87G/L+b03m
 rhFLVpdIW8VhWmmMwSCBO6IcpOWgmdaz1mP4CDtCtLaxncaTborhmmODE9r5TIxIIeBcL2zvs
 pcxlK9cK2Cr0xF3AzaedEpdRCZW+OS/PfYPXoA3XQ7ZSULLjdrc0BRv7CVy2hCMg5kzkEPlka
 zeyMxMEVaSQ535cOeWD6D/AVyYcKOmeEBI6xlufew2uIUBT2Vn0RkivRJiRbHZqxCgiPQVbOz
 Km9M6Y++j51Aj1HYQSQPCQDty5DWht0q3I30EaJYafDKUJRr2ANnY/xH2VLCj643ElIYiwoO/
 DJaiexE8kbP/mhEeayApuLZFVMHzz8qIjSkAoNLBW9y8pn12PDH3d3UESsf70rKacLygmxQwo
 Ly7woKDRPGjM1P9MxRQE/NDKw4/lhCHt0DjvS0Cotv7iXQIsnoHsX6bRslOclBaulTL+SAg59
 uqi6LeVYc2gwGKjg6VWvH0Z8ajMmbqdDwBqTPE4FtrdBc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_092139_561885_00E8A46E 
X-CRM114-Status: UNSURE (   9.73  )
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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 6 Feb 2024 10:05:34 +0100
Subject: [PATCH v2] pmdomain: mediatek: Use devm_platform_ioremap_resource=
() in init_scp()

A wrapper function is available since the commit 7945f929f1a77a1c8887a97ca=
07f87626858ff42
("drivers: provide devm_platform_ioremap_resource()").

* Thus reuse existing functionality instead of keeping duplicate source co=
de.

* Delete a local variable which became unnecessary with this refactoring.


This issue was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--

v2:
The transformation pattern was adjusted based on advices by known contribu=
tors.

Examples:
* Doug Anderson
* Geert Uytterhoeven
* Robin Murphy


 drivers/pmdomain/mediatek/mtk-scpsys.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pmdomain/mediatek/mtk-scpsys.c b/drivers/pmdomain/med=
iatek/mtk-scpsys.c
index b374d01fdac7..59a7a8c261ed 100644
=2D-- a/drivers/pmdomain/mediatek/mtk-scpsys.c
+++ b/drivers/pmdomain/mediatek/mtk-scpsys.c
@@ -425,7 +425,6 @@ static struct scp *init_scp(struct platform_device *pd=
ev,
 			bool bus_prot_reg_update)
 {
 	struct genpd_onecell_data *pd_data;
-	struct resource *res;
 	int i, j;
 	struct scp *scp;
 	struct clk *clk[CLK_MAX];
@@ -441,8 +440,7 @@ static struct scp *init_scp(struct platform_device *pd=
ev,

 	scp->dev =3D &pdev->dev;

-	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	scp->base =3D devm_ioremap_resource(&pdev->dev, res);
+	scp->base =3D devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(scp->base))
 		return ERR_CAST(scp->base);

=2D-
2.43.0


