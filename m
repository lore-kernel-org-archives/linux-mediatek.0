Return-Path: <SRS0=Kof6=5Y=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F968C2D0EC
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Apr 2020 01:29:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A4A4206F7
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Apr 2020 01:29:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A9qdvfC7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A4A4206F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZAMWZ3QfZjPRhZtRbLSrGgKjeWCCaImMPqwaolMpULA=; b=A9qdvfC7jCcZhc
	w1fIDBbfFurL7CdkXVk/2vVCON/MhuCXR30OuVxVweA3yIQFhBNwvuMGsc0tGBpgxu8tRWcDHDu0P
	sknllIJa24rAs++y9bnhveQsmOF6AC7I+cw9I09FIz1FAcJpnTep9iNtoFkrtBLIErqEzKFZ4icY5
	/+oF/yprwHL11jCXsLywqDzrRyYQN/G6ZS0A+YYSDRb1SyN7IZqFv8LcxFqifMbf+IdKQSmJ7pZEl
	SpU8Gdguhqui5i/iB0m4qzvXz+pdlOLdPAaNZcEjrxjCw79YfUlAbRCnUiBHuxMQwFzR0qGYISOuq
	VqH/YV+mfwnhMN8OtOGA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLzX7-00074O-99; Wed, 08 Apr 2020 01:29:37 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLzX4-00073a-Py
 for linux-mediatek@lists.infradead.org; Wed, 08 Apr 2020 01:29:35 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 0E9141210A3E3;
 Tue,  7 Apr 2020 18:29:32 -0700 (PDT)
Date: Tue, 07 Apr 2020 18:29:31 -0700 (PDT)
Message-Id: <20200407.182931.890813308824136193.davem@davemloft.net>
To: sean.wang@mediatek.com
Subject: Re: [PATCH v2 net 1/2] net: dsa: mt7530: move mt7623 settings out
 off the mt7530
From: David Miller <davem@davemloft.net>
In-Reply-To: <1586122974-22125-1-git-send-email-sean.wang@mediatek.com>
References: <1586122974-22125-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Tue, 07 Apr 2020 18:29:32 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200407_182934_841546_08493FEF 
X-CRM114-Status: UNSURE (   3.51  )
X-CRM114-Notice: Please train this message.
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
Cc: andrew@lunn.ch, Landen.Chao@mediatek.com, f.fainelli@gmail.com,
 steven.liu@mediatek.com, vivien.didelot@savoirfairelinux.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, opensource@vdorst.com,
 linux-mediatek@lists.infradead.org, john@phrozen.org, Mark-MC.Lee@mediatek.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: <sean.wang@mediatek.com>
Date: Mon, 6 Apr 2020 05:42:53 +0800

> From: Ren=E9 van Dorst <opensource@vdorst.com>
> =

> Moving mt7623 logic out off mt7530, is required to make hardware setting
> consistent after we introduce phylink to mtk driver.
> =

> Fixes: ca366d6c889b ("net: dsa: mt7530: Convert to PHYLINK API")
> Reviewed-by: Sean Wang <sean.wang@mediatek.com>
> Tested-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Ren=E9 van Dorst <opensource@vdorst.com>

Applied.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
