Return-Path: <SRS0=oOjZ=O7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BCF0C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 14:55:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BA2A60E98
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 14:55:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6BA2A60E98
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=25MXGfrF35GRSL5PhGcHl92K3Il9oJJvqt8D2psnxoQ=; b=W1YU6xWjUfStuF
	slIAA7q8lNkfxsB5+pRXcacjBkSZLEoE0BkxKb6IRl2h3uFBWSjLhYgT+P7yiAPi8bx8QAmr/CFQ4
	2Us8Ue7ZnUr4ikFcsl4yIFcYxepiqvf2zDaA5OFqBMrVNhwJ0oQ3UFicUdbOyocda6dANpRioahXR
	VUQHLA1ItE5Y/4iyEuqSi+iVBIDCPmTZqDYXfk/MJpdOg/wUOQiebHT9nY542Ry7QAIlpc4wyXFuF
	AeNHa6OiPNkcihR3D7vbxAgTLsboMl+MbTJSPTZ4Wn9LZC6vg9a2SUFjN9qCwzeHm/ymRU4UIdRHA
	Sym3wTYwSQT8/3ynzRAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZwhd-009q2I-QR; Mon, 11 Oct 2021 14:54:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZwhO-009pxQ-Ui; Mon, 11 Oct 2021 14:54:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0308160BD3;
 Mon, 11 Oct 2021 14:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633964082;
 bh=gwJSn9/WH7jBGPOAUDejmOq4MucxMh1nnl8hVskmGKg=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RLXL8JTtS9kxXS/WevrlPHbybeW2+Wj3vREClcrUCBJWTTwurdSVFo4p+j1QWcbUF
 fwg8dtLQWpv7CuRYEjHjh6vm+FxRCC+R7EInaVvaYKD9Z6g7HahhEI1gRMu9RfgqOI
 UZDppynooEe86MhXQMeuBd7B0JwEUnsqilu/qAQ60euugDk6t9Hh7/5cVU1qU5jQvp
 WZpbunu7835k3aDb2E8Jx2uLUkQuZ8DblxbpouZ//MiV9VPxE/pUYrJH8VSRViQoje
 c3l70DsVLVELapC7akV49aOZGkQJWLxjVVrvXJGq/PM/n2BAcJDea+WQE6gjhln6xH
 Ea4iSPcYY+DzQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 SoC Team <soc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [GIT PULL] soc: mediatek updates for v5.16
Date: Mon, 11 Oct 2021 16:54:27 +0200
Message-Id: <163396399141.3170841.8977960189531317594.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <b1d364d0-f2ae-488b-b3f7-c694049c20d3@gmail.com>
References: <b1d364d0-f2ae-488b-b3f7-c694049c20d3@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_075443_029236_DB5A8669 
X-CRM114-Status: UNSURE (   7.26  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 11 Oct 2021 12:01:04 +0200, Matthias Brugger wrote:
> Please have a look on the changes for this round.
> We have support for mt8192 in the mmsys and mutex driver. Apart mmsys now
> enables it's integrated reset controller.
> 
> Thanks,
> Matthias

Merged into arm/drivers, thanks!

merge commit: 24e18b0f45c7830a74400aa599e4e3d67155ae1c

       Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
