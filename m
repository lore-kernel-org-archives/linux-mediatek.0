Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60EB6C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Dec 2021 19:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BWKMnaxR1E0oHgakqv5mh8Vn52aCFGRSddOQ188+pF8=; b=eFcVAVnVPstBkv
	HwPcZI+8CJ8LESmEJbwj8KzcAwO3Fn+M7Idm+FpCPZH3nNLi1uPui52QsQgNCwK2ptlVBANuEnuf0
	VtERNScd2kQrJOyjv6SEtBS20Bb43I0ExrFYTlPw4hrvEoRK8Vg3I8rBlvpTXvdCdHw+V6vIwpJwx
	II90nRN1tm5QO15EnRbsnE55WOk4skwGNEOQZinXF/u7R52Emk3A8NTPRYncqVs9X8Plhq0sNa/u0
	N4kOgHepX0pCk7Y6OJ+xXEjHjtQzkoZZ0PFY8bQD3xM6xzySgX9TIgfjshO3sqCargckpNNtbC8xW
	GBxqK2D6PyaEfYvBmVhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muJqm-005WT3-5y; Mon, 06 Dec 2021 19:40:36 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muJqj-005WSE-Fk
 for linux-mediatek@lists.infradead.org; Mon, 06 Dec 2021 19:40:34 +0000
Received: from smtpclient.apple (p5b3d2e91.dip0.t-ipconnect.de [91.61.46.145])
 by mail.holtmann.org (Postfix) with ESMTPSA id ACE26CECF9;
 Mon,  6 Dec 2021 20:40:32 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: [PATCH v3 2/2] Bluetooth: btusb: Return error code when getting
 patch status failed
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20211206173343.31380-2-mark-yw.chen@mediatek.com>
Date: Mon, 6 Dec 2021 20:40:32 +0100
Cc: Johan Hedberg <johan.hedberg@gmail.com>, sean.wang@mediatek.com,
 aaron.hou@mediatek.com, kaichuan.hsieh@canonical.com,
 pmenzel@molgen.mpg.de, linux-bluetooth@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <B19A9F73-E925-4E69-81FB-51C135FD95EB@holtmann.org>
References: <20211206173343.31380-1-mark-yw.chen@mediatek.com>
 <20211206173343.31380-2-mark-yw.chen@mediatek.com>
To: mark-yw.chen@mediatek.com
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_114033_693848_CEDB6B84 
X-CRM114-Status: UNSURE (   8.80  )
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

Hi Mark,

> If there are failure cases in getting patch status, it should return the
> error code (-EIO).
> 
> Fixes: fc342c4dc4087 ("Bluetooth: btusb: Add protocol support for MediaTek MT7921U USB devices")
> Co-developed-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Mark Chen <mark-yw.chen@mediatek.com>
> ---
> drivers/bluetooth/btmtk.c | 1 +
> 1 file changed, 1 insertion(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
