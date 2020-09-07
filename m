Return-Path: <SRS0=DUBy=CQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68705C433E2
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 08:30:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05E55208C7
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 08:30:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cg23HDVn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="Q5FRZguo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="dbiCg0mc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05E55208C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-ID:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4j2+gSJX3R2gqVfFd/WIDhX30beGfVh0NI19GXgyxUU=; b=cg23HDVnrvraFp56RCPMk9AaU
	f0axm4fAGOW5/UvnFG3qEGVdkmdSrpaG4b/WU3AIQBESDNVG8akbspzQ5Bo+yJ7E6MSDEYGyFQWoM
	r8NZLY0a+qgqGzwmK3h4R1OCkomfkuC9qXne2PxdfXgSqWedzwkreQZGNXpsyiV/ZmqhB4nIw3uqN
	Dm3aQpll796/J/vPwdOJYxFWjofi5OBxpZHJutWg9y1Vg+yg+gzH97aLoUNDQ1VRwvhrUaH0lcchG
	jn1a3uOJw0tmOKoqnAFakqYclLNP1YpHeIsY4Fc8zKnxLwNTB0ujENcLt8VzvwTrFy6/vZek/dDBj
	r1sede3Ew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFCXZ-0002lD-5f; Mon, 07 Sep 2020 08:30:17 +0000
Received: from a27-187.smtp-out.us-west-2.amazonses.com ([54.240.27.187])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFCXU-0002jy-RZ; Mon, 07 Sep 2020 08:30:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599467407;
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:From:In-Reply-To:References:To:Cc:Message-Id:Date;
 bh=8o5pkbbwRSOnppHz4VSCmTzwH503Kp85jZQlaDj4Y44=;
 b=Q5FRZguoyMLJvyIx8qemqfWeJ+8Q/A35Yy3rLLVRDP/ZxVTOt3i9GfEllzT0FfOy
 9QfH0RjM+1xX1z3dKnhHI9oHpCumdHm36gHNhEC+eoScKGX6mrJ4+LjGXkNyHpM2s1S
 NmkWOM1DcvDQFLn1YaMRKK7tp1yvJgl6GITQI/Xg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599467407;
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:From:In-Reply-To:References:To:Cc:Message-Id:Date:Feedback-ID;
 bh=8o5pkbbwRSOnppHz4VSCmTzwH503Kp85jZQlaDj4Y44=;
 b=dbiCg0mc+gaG1qoIsn7TeCn4dHuv7HCjlATCIzeUdrbKHN7a76FQ87WJVsiOkx1N
 kQNxrWfx8+ljWhlysoXRiuFuVnCVYYfNxryGtA/k84FrydjluZ9GsoWo7vC+Q/Bzvh6
 QILkJV7gc9R0OFq18sJatdRONDcOeLBLXruA3ywU=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 780D9C4345E
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH][next] mt7601u: Use fallthrough pseudo-keyword
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200901173603.GA2701@embeddedor>
References: <20200901173603.GA2701@embeddedor>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-ID: <0101017467afc7e0-bfeea581-1dea-4e42-8f93-042ee8ab2c58-000000@us-west-2.amazonses.com>
Date: Mon, 7 Sep 2020 08:30:07 +0000
X-SES-Outgoing: 2020.09.07-54.240.27.187
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_043012_961622_CB556BC3 
X-CRM114-Status: UNSURE (   7.69  )
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
Cc: Jakub Kicinski <kubakici@wp.pl>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

"Gustavo A. R. Silva" <gustavoars@kernel.org> wrote:

> Replace the existing /* fall through */ comments and its variants with
> the new pseudo-keyword macro fallthrough[1]. Also, remove unnecessary
> fall-through markings when it is the case.
> 
> [1] https://www.kernel.org/doc/html/v5.7/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Patch applied to wireless-drivers-next.git, thanks.

1808191dca82 mt7601u: Use fallthrough pseudo-keyword

-- 
https://patchwork.kernel.org/patch/11749303/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
