Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1113C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 04:46:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E63A6108C
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 04:46:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8E63A6108C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kAFpIP4OlNqPgU/iT+gdIlSM0q++mJnAAZ+WjTleWNw=; b=St8GA7kjNhVyO2
	b5HZdO6LDBm0A5TqfjxukW6sQUSUDiQI3+ETbvdXNuAQBgJfPO3FF62+/P2U286ifY76FG3nHNFo/
	91JlMlTua6CQH/48fijv5eqQjvV4FFHr1CUau64zJN4dq7sbKoEHDG4xztu7YkYGKD9m1cVWOQchx
	9nzY4Tff57xtIth3gH5Gge3N5+ZERlLRfxopT0rGtg0Uv09wUjXIps129Bz+fKPd/K1vs1xCIfkOt
	wxsfu4SJ24TtpPmlOiovQjzyyXlLVBd/mFOmc+XZb4mBeL6fAbJTSTmFfF61nDpa8ApSgD6R/wW3E
	aVHdtuVsRqCxu3Pk7nVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8EzM-00DF7r-Rp; Tue, 27 Jul 2021 04:46:44 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8Eyo-00DEt1-VW
 for linux-mediatek@lists.infradead.org; Tue, 27 Jul 2021 04:46:12 +0000
Received: by mail-pj1-x1032.google.com with SMTP id
 ds11-20020a17090b08cbb0290172f971883bso2404902pjb.1
 for <linux-mediatek@lists.infradead.org>; Mon, 26 Jul 2021 21:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lQui5Bn1AetwvRytXDb4JDYFQOZL+N4GRQAdei53URs=;
 b=Th5t3G/Ufa2Ob7SpZUUyIAqxOzwb4tOZFM+k1JoB0DhM88V1pL4Yr0MkoWzKCRp8OS
 tqH8uIZnwJTKC1IkFWUfKxGxMcqRPyUn6Tqb4bCPhxgQgSaqQuyODZ7itTLs/L8/O/AD
 F6uVySNBTaE7l2hLFTzeKgys751X40fDx1XBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lQui5Bn1AetwvRytXDb4JDYFQOZL+N4GRQAdei53URs=;
 b=dEiP6fp3aQw2EeQJXFkpUbgJ9GUzb7YMuJKVNH3F3NuBgFedwsoi0Vdc/WwzQvn16q
 tsuqd440zW7H3qnKkaceRDdHF1/GmOZEu2R/m+KUcGy5WNxlF6O3e/6+OOd5DVb+uMiq
 BdejLb6+YGcR6g2uRnzrc1cG7C/xQl33Wku8kxaGSYjOy/IUaDKZqvnJ6Kz5Ych8nJOT
 L35JZvCJY8oypYVt56v6N6VoQpDp4HQp2cOmYjRk+BY+l6HE/kH8K/wRJHOxPUQjkd1u
 gRJxwBZhrc6jXt+xCZdx7mJSHy4tu0QDjoQLxuxkpvXQYQ1moQN3QXy4q1k5E0YY/PFm
 lMOA==
X-Gm-Message-State: AOAM531/y3ye6ymk9nPg1vJm/GkxM6STMg/ReKr+6n8HzHtFbGCVQ4xO
 7n1Wlmnxq+25NYtnFxb78GHtizbR/UU+NCtemoUFRRQHI6/610oP
X-Google-Smtp-Source: ABdhPJyHwFZ5Iqv3unP+z+8lBwV8+TrKOxTRo0U3vA0SXeGCBVMXgm55Ilu8NwejZFEDdz1+OD/t38J49y/2dvAffKs=
X-Received: by 2002:a17:90b:2251:: with SMTP id
 hk17mr2395627pjb.126.1627361167866; 
 Mon, 26 Jul 2021 21:46:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com>
 <20210726105719.15793-19-chun-jie.chen@mediatek.com>
In-Reply-To: <20210726105719.15793-19-chun-jie.chen@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Tue, 27 Jul 2021 12:45:57 +0800
Message-ID: <CAATdQgDeXHhFQY8ktOYTaeZGUTuNrJOSuPSC5kuBASS7_8hsgw@mail.gmail.com>
Subject: Re: [v14 18/21] clk: mediatek: Add MT8192 msdc clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 open list <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-clk@vger.kernel.org, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_214611_034135_69894B9C 
X-CRM114-Status: UNSURE (   7.35  )
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

On Mon, Jul 26, 2021 at 7:00 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8192 msdc and msdc top clock providers
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>

(snip)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
