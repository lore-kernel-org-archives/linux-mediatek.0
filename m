Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09578C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Nov 2021 10:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xyuCVNHZOo/bYlGnuInFYRT+9J5Vb24e7FNHSBRiHW8=; b=2JR+hayK4GyCPGDla1tg+7nqzk
	FWGj0kssxWHbG1g7nJmd9dTNQISZJpRgQYfSDqZD8mtUglE25etv6S6ZJtXqgRn3fkolSCo4I/3n/
	s8nkJlZ7o/AaYPTqs37lZ3n+4wY9CsIWivpw+fizy8A0AulsgO/+KJvxBXgCSnKZiy3aXQy7RrlsH
	Rtnlx/x5AAeVet9a3l3QaDl5k9bl5a8r07SEd21hhgahQrc8Mw7m4ex8DSP/cwZw0ArvXbv26eA9k
	XqIqr63kGtLLTxZCotigyLpTvvtSdPFqAYBdB10x017zoUL7apKuCzD7rsVylsnb3WUjo6sRr/imV
	PCGb3A9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqYWI-00A1Px-B1; Fri, 26 Nov 2021 10:31:54 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqYW4-00A1Mp-Ns; Fri, 26 Nov 2021 10:31:42 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D11DC1F46790
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1637922699; bh=H06EdMXymS4zBmamOUkgbxwP59hf5SsyyaBQT8e4hSc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=P3w+IgB2bojbnEejZcPtLhFEklaVwa+TxNDQ+wPhx6G4l0QlNc7VKNvc3XXjAcatT
 4OPpLFN0c5JfxqzNXSh+u2OuTdh4oMir4cEFw7LsDHojbsz+TOTJdQs4eQL6dSbYGA
 btzOqeqMJV4MizPDsRNt/xT56Lonoo11oWLav8TLDY2Mq618hEE46Bn7VSzMAo2mRP
 rKtNDLjwQNAOVt0p6hF1h75m9nSGVrfHsmdNUUGG1ul/46szMMEE9Vnoi16a24LW2Y
 SN8iJM+0CYZKx+j3bdBSUeS9oTLOUry5Q7dMNK4/CuHJNRpvzlKYF3eo88pqFkf97h
 lho9hf+PJcgOA==
Subject: Re: [PATCH 1/3] dt-bindings: usb: mtk-xhci: add support ip-sleep for
 mt8195
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211102060049.1843-1-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <ef3991ab-846d-0d2f-5fde-3677c2f7db9c@collabora.com>
Date: Fri, 26 Nov 2021 11:31:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102060049.1843-1-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_023140_998008_027B3B6E 
X-CRM114-Status: GOOD (  10.13  )
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

Il 02/11/21 07:00, Chunfeng Yun ha scritto:
> There are 4 USB controllers on MT8195, each controller's wakeup control is
> different, add some spicific versions for them.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
