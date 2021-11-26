Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03004C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Nov 2021 10:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZoL7aqfL/tO58WjTzEBlpTlKPxkHa37SECi1qHK+afA=; b=fQ+TTWcfnmSaNZNcZY0QCeYw27
	1xE6ItvJQCwkHv66I/Yzgc1eaPBuR5X8jrSa4qzMRgO/Dd+GJfQ/3d8AtFazvW7fMUIR8A+tqAli3
	MP6KeRRxaXVWT50JUfL9R+P2D397SHT2FJXi655UqDi/5xZeweMy2daezGjEfdRajZxUPttClRlJo
	UAOkzTJshUeqiyUhcq8ahWNLsRtsEAUD0YirUCrVbjDBizwGezT00YSOIrp47tKIYc1LCmGAyz9l7
	4oY074xj0TH9cZBzE4W26PcruEuYejbTdtPqfxu/2QgBvyJKkyhju8tBfXFuZa/qJmx+Tg2XY3sYl
	26pPwlQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqYWk-00A1Yn-OT; Fri, 26 Nov 2021 10:32:22 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqYWP-00A1Rf-Q8; Fri, 26 Nov 2021 10:32:03 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 293091F4640A
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1637922720; bh=EuVPphaZZHTIORgNUJBNbSYK215LbmQjkprREz5uJ58=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=F4JId67VGNEu5LJXAn8aS9r/oXSoaWwzBv/o5EF0qKQczIe+/9s1MuPVHAg9itCth
 4r1HdOPXA6PoqsXk7NYTkB77x6EeKhF29KY3DJYxqus+1cX1nKAdDq4jHXF/pX1P79
 +fKoQgmtW/MmK9abf0he9VrSiD523i0u+vEnu8p1bKNg2XNCkFmiFPTDuXRbOFb8YZ
 wfdoYD3R9jWPksp7AP/rk4Yi9SuhWk7AHU1d4OBAnkM8FGuuD+P7YMqq8lBLAc/hGU
 w3v2ujn6sqaMdxe6nigJT8VOqhe2qMXccwwbZsQRcB7j9KlMSectJd5mNlAhru9ljE
 UbxELATJrigqw==
Subject: Re: [PATCH 2/3] usb: xhci-mtk: add support ip-sleep wakeup for mt8195
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211102060049.1843-1-chunfeng.yun@mediatek.com>
 <20211102060049.1843-2-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <c3e56137-7dee-9418-9d69-d583fa26b034@collabora.com>
Date: Fri, 26 Nov 2021 11:31:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102060049.1843-2-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_023202_036243_8EACECAF 
X-CRM114-Status: UNSURE (   9.85  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 02/11/21 07:00, Chunfeng Yun ha scritto:
> Add support ip-sleep wakeup for mt8195, it's a specific revision for
> each USB controller, and not following IPM rule.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
