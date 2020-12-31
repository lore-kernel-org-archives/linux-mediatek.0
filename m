Return-Path: <SRS0=2t6o=GD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D9BAC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Dec 2020 08:13:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D10EC22262
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Dec 2020 08:13:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D10EC22262
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y4QfJ/G+AaEan+nifbIAkCVQmt0u7liUnxi2kAMHoBs=; b=qzMBdZv8wokIFMrfsxxSv0IZ9
	bvLX3IUZ/QArg3bYscWpbz1olR3DpjpBKk8AkYXBrsf1Ce08SINdHH3D8VL+0p+WwozaEXXlvXWYJ
	YOzET/7qNCYSVSn1ckauaHnUftbtfXV4gHeD8/mnrb6Nf29AybDleiexRPTyYqB1pTFf2eQcFO0AV
	LAQC+3t2IhRtqqw/B+O5V9n2p2we/NBQfEeRyVZ7rvD9pHbiyc0TUmwATrLnSIoqP4i6k1tPGPJzG
	ZBQsLlz0TsPlGAA9aYC97oIYCDOFQi+SjX7NsAfnRq1Pc/4fXyqIpUqTkcdkAfrf6OQhxM9tILpyw
	Oz8YlrKoA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kut5T-0000CY-Ic; Thu, 31 Dec 2020 08:13:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kut5Q-0000Bp-B4
 for linux-mediatek@lists.infradead.org; Thu, 31 Dec 2020 08:13:34 +0000
X-UUID: cc5c83f9ae3941058f3f567f17a11d6a-20201231
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=0YIiBbPcnXnoRpcQRpSuIjCOquv1iDX2d7sxAgSif/8=; 
 b=MrkeYOUZowizVdZj0HsVkgAMa/Ch/JPuAJLnG0Q21a/EN/ZjgOcIqZ3KmDeRHlWYzQlR/M1V+sQ+ko0+9dw89zwWZ1uY3Vopwx7DRQ5LySvh182KnF+ZTuCfBbezgW3PpoppnVWvB4JrHmsu74VrKRSwjjqoX1whUq7FBuSGwK4=;
X-UUID: cc5c83f9ae3941058f3f567f17a11d6a-20201231
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 778890749; Thu, 31 Dec 2020 00:13:26 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 31 Dec 2020 00:09:18 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 31 Dec 2020 16:09:17 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 31 Dec 2020 16:09:16 +0800
Message-ID: <1609402157.22614.3.camel@mtkswgap22>
Subject: Re: [PATCH -next v4 03/13] mt76: mt7921: add MAC support
From: Ryder Lee <ryder.lee@mediatek.com>
To: <sean.wang@mediatek.com>
Date: Thu, 31 Dec 2020 16:09:17 +0800
In-Reply-To: <3969b56ae9211955428fad2aeba695416362a095.1609347310.git.objelf@gmail.com>
References: <cover.1609347310.git.objelf@gmail.com>
 <3969b56ae9211955428fad2aeba695416362a095.1609347310.git.objelf@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201231_031333_130063_EE4EFEBE 
X-CRM114-Status: UNSURE (   7.28  )
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
Cc: robin.chiu@mediatek.com, ch.yeh@mediatek.com, Eric.Liang@mediatek.com,
 linux-wireless@vger.kernel.org, posh.sun@mediatek.com, YN.Chen@mediatek.com,
 linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 Lorenzo Bianconi <lorenzo@kernel.org>, Soul.Huang@mediatek.com, nbd@nbd.name
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-12-31 at 02:06 +0800, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Add Rx packet description parsing, Tx packet description compositon, handle
> packet recycling and provide MAC information mt76 core needs to support
> mac80211.
> 
> Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Co-developed-by: Soul Huang <Soul.Huang@mediatek.com>
> Signed-off-by: Soul Huang <Soul.Huang@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---

Trim the code. Please take these fixups into account.
https://patchwork.kernel.org/project/linux-wireless/patch/65336148b5d440dceb967a401488b119e14b9c5a.1607124652.git.ryder.lee@mediatek.com/
https://patchwork.kernel.org/project/linux-wireless/patch/69d62cd40ae52e0ddd5b26ba96bc7480385585a5.1607578601.git.ryder.lee@mediatek.com/

Ryder

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
