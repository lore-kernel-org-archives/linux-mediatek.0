Return-Path: <SRS0=GXkz=C6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C49C43465
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 16:52:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92C06206DC
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 16:52:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="x+EPhI+M";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=wp.pl header.i=@wp.pl header.b="UGtNTtqV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92C06206DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wp.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a1q1smTgEPCs/L+w/agJ5E8/V/fAbHZ4JRheIVLN7sc=; b=x+EPhI+MMALpasV/qUY8cuxP4
	E23uF9tGmvZc/2kjbGzJIAqX2url0QJrovVAD2FZn35BquzX+ZGEmnh400KKtbKKnOoaY8lRht8a2
	UUKsMpoqXPRuUTuJwNHBVcTq28O4eETqGWpwKzLfRr0mssWhoWh/J9j4ruOSJisOOqO5jG9+ctDfm
	0DNFRwaQ7EaWO0i1Y+i5ABt/9Cpq9yLB8gdpjzgzanxVZV6aA8p3y+kBpk9aIpsqC6t3HEROsEnhB
	7IZk9pparBm1qaomnu6xycugcQYMRvPltikxaVeflCwnug/XJd8Q0AlCJTJ+PSbthAfI7+rSfsa7Q
	6p6r4CzfQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKP2x-0004JZ-VH; Mon, 21 Sep 2020 16:52:12 +0000
Received: from mx3.wp.pl ([212.77.101.9])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKP2v-0004IH-8z
 for linux-mediatek@lists.infradead.org; Mon, 21 Sep 2020 16:52:10 +0000
Received: (wp-smtpd smtp.wp.pl 13450 invoked from network);
 21 Sep 2020 18:52:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
 t=1600707124; bh=pS0s86wtkZkGCWMQlTJztTBVhkWnFMCqOcJVff4yuvc=;
 h=From:To:Cc:Subject;
 b=UGtNTtqVtarl+XyGa2kB6cBeaa1BuI25AzUDueNTQn4DfiC1reVPXnlraaiDLYdr+
 Mp8omSuKlE4ifX0O4Jiiqe8mTv+MN7VJqtyabyr7ALqCuG9atTQPpQSiXK8s6oYJyH
 +dXpaI2dL/GQhV/9FxwiRa+lZLaUqcoWKiCFFLE0=
Received: from unknown (HELO kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com)
 (kubakici@wp.pl@[163.114.132.4]) (envelope-sender <kubakici@wp.pl>)
 by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
 for <miaoqinglang@huawei.com>; 21 Sep 2020 18:52:04 +0200
Date: Mon, 21 Sep 2020 09:51:57 -0700
From: Jakub Kicinski <kubakici@wp.pl>
To: Qinglang Miao <miaoqinglang@huawei.com>
Subject: Re: [PATCH -next v2] mt7601u: Convert to DEFINE_SHOW_ATTRIBUTE
Message-ID: <20200921095157.2cd0414e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20200919024838.14172-1-miaoqinglang@huawei.com>
References: <20200919024838.14172-1-miaoqinglang@huawei.com>
MIME-Version: 1.0
X-WP-MailID: e1ebc130c8383d7528f1935eea539bf8
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000001 [gbJj]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_125209_554339_2CDE3177 
X-CRM114-Status: UNSURE (   6.69  )
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 19 Sep 2020 10:48:38 +0800 Qinglang Miao wrote:
> Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.
> 
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>

Acked-by: Jakub Kicinski <kubakici@wp.pl>

You can keep my ack. 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
