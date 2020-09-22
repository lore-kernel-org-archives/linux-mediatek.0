Return-Path: <SRS0=fRkw=C7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFAB1C2D0E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 19:57:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 631DA2388B
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 19:57:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KA2CHHNR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="X6JHUiS4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 631DA2388B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bsqP5FkTDeXSjh3hUqYHAEOjPNTQCXc9lQePS3OJPbQ=; b=KA2CHHNRnNve1zMLtO6aEUj8g
	OBziB4/YK2tCwhCMn0MX8tzh0KfublrB0MxAcV4tnyZf7nSrBcx2PVMxG2mAnGEAcL94wyv+Wr7CD
	Q+OcNpkusleCjZaNuDMg5LjSMONSDhJWUBI/jkNe34e603KvXwK7jvlYsZ0V9omtm7/oeOVKl2yEh
	wYwW792YuZcE+hZvWTR1jeSToKO3CD4rhRn9Uze4T3nXzc/yN4KFHafPNFQz0j+nlyKhTdzfyWK1E
	5vYws4qXdef9Clr3i9TNMCaa2qRn6mzkvCQRM5rfA33MGIajA6Yci6D3nNYvJMYk4eOCChtHrM+Eh
	ohl+D8q4w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKoPF-00084A-BA; Tue, 22 Sep 2020 19:56:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKoP7-00081n-S2; Tue, 22 Sep 2020 19:56:48 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C33DE221E8;
 Tue, 22 Sep 2020 19:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600804604;
 bh=W+iHN5ru8hU8FsEqA6+NPs3FQxVIkYRCyEQVqaxXkJ8=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=X6JHUiS40tzdoFtmb2sTu1lvkBxyi+p4e6imhSrziuGXslhjEC7vYyyHXnN1hrBY2
 E27/saitvO3/e971ry5IX821KSajl/jC/BLmet2ex+rpY9pFpYM2rDuAi25PPg2bGN
 rBZz5hTDrqG/2iuoT6k6ala2DRlNIu2EkYrEmti8=
MIME-Version: 1.0
In-Reply-To: <20200921082426.2591042-1-liushixin2@huawei.com>
References: <20200921082426.2591042-1-liushixin2@huawei.com>
Subject: Re: [PATCH -next] clk: mediatek: mt7629: simplify the return
 expression of mtk_infrasys_init
From: Stephen Boyd <sboyd@kernel.org>
To: Liu Shixin <liushixin2@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>
Date: Tue, 22 Sep 2020 12:56:43 -0700
Message-ID: <160080460341.310579.1203602714296917820@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_155646_053612_3BB9583A 
X-CRM114-Status: UNSURE (   7.36  )
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
Cc: Liu Shixin <liushixin2@huawei.com>, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Liu Shixin (2020-09-21 01:24:26)
> Simplify the return expression.
> 
> Signed-off-by: Liu Shixin <liushixin2@huawei.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
