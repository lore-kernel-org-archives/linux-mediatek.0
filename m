Return-Path: <SRS0=ZAsA=HL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A2F5C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Feb 2021 07:47:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24E0964EB8
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Feb 2021 07:47:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24E0964EB8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/OfN5wao6Bl74jaDnpyRfvcLLzuMTlnwmTUIIHmN8Ek=; b=QPdYBYGnxELA0dmKZp2m7dc/9
	Yt6ZEaf3+XuKe/JmOf7p+x+8AdYkb/ncBPOfhgzK+vb/r/xQnbJNifU+5DPay0yWTZwOdwfjhNccv
	YfbCCPjdVllRWdQ+NWSrfuj6nnHlTO+aP55/bRVpvfV3aRyv3lELEGyZaGF7wqkE/+7SUIQ/jhK/6
	U8WJEnYhle6nPTr2tLbHgcLo7Aem+3w+k6GrGBqqRq6qwTYOpwYCWs/kRjEPEjb6hCPDcR9jnygnN
	Ilhcii/N5LvU8hImVaBdcie5IRH3GGBTH/3dOfi+n9TSHtELgVfFhnZp7ZyZ4ixwa0Lrw/Yr3era2
	XBXAhMskw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9Nk2-0005EH-UT; Tue, 09 Feb 2021 07:47:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9Njx-0005DF-7L; Tue, 09 Feb 2021 07:47:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3EA0A64DAD;
 Tue,  9 Feb 2021 07:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612856836;
 bh=F22jfFy9W8oMUmsbBd5rEjgo8FcPzu5fWH8d+uvExto=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=X1TeLjv/DpMG9iI/wnak/vJu3odgdTETbzOp/lO3340oyZcyIARHd1Sp6CplwyPGY
 gMolQ7oKa5oc39yze9j70lMSIdX8Oi7iqIN1TeBRuj1fHvi39/+LN+B7oqtd9fGABl
 ABjp2Jcvf+oRToTq0mrG4gixhJ4bCJV1JS4PlrnvQBVkHGiBj4/whmbQt3cG4QJA5R
 td2P2u3WgcmB4aIKLGarQKtCBqcfj54pOH5FDST8D6P7A3zLuwIUgjp1UDgvUIJfOr
 NagsmNgJb+bFLu7+LrVRtR5XIzyg/mNO3uKTLNRxSw05cny9R5RjObyoTmPjM0NtGL
 IXvRMhWnjQqMA==
MIME-Version: 1.0
In-Reply-To: <20210203105423.682960-1-enric.balletbo@collabora.com>
References: <20210203105423.682960-1-enric.balletbo@collabora.com>
Subject: Re: [PATCH] clk: mediatek: Select all the MT8183 clocks by default
From: Stephen Boyd <sboyd@kernel.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-kernel@vger.kernel.org
Date: Mon, 08 Feb 2021 23:47:14 -0800
Message-ID: <161285683488.418021.7723049164920384151@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_024717_382572_13E4DD22 
X-CRM114-Status: UNSURE (   9.55  )
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
Cc: drinkcat@chromium.org, Masahiro Yamada <masahiroy@kernel.org>,
 linux-clk@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
 Mars Cheng <mars.cheng@mediatek.com>, hsinyi@chromium.org,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 Owen Chen <owen.chen@mediatek.com>, Collabora Kernel ML <kernel@collabora.com>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Enric Balletbo i Serra (2021-02-03 02:54:23)
> If MT8183 SoC support is enabled, almost all machines will use topckgen,
> apmixedsys, infracfg, mcucfg and subsystem clocks, so it feels wrong to
> require each one to select that symbols manually.
> 
> Instead, enable it whenever COMMON_CLK_MT8183_* is disabled as
> a simplification. This would add few KB in the kernel image size but
> will make the life a bit easier to the users, anyway you'll need to probably
> enable all of them if you want to have proper support for that SoC.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
