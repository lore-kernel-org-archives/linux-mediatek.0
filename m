Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3A62C432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 04:41:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92CC26108C
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 04:41:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 92CC26108C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3yq99UxmJRDEhRkD+oaMmNDSKqk5A9dIcGtzDGMhea8=; b=3Aahes+AuFDrLo
	HNpyop8eFnIit38VRdQLYDGG6WerOAqs2AnB46dvyK8FkwZ/N/+zMMUe89DG2rreFUkrWCBKYmpaX
	/F250/SYuGGQBEajI9MASkbJ7QOywHkf9ncDlz6M0p+ZSyh2vVoPsO8RTLQjxhtMyFofQyr5rY0qV
	i3QQQOqTj7rTC9vAdFROunFu6skPhCJ1vUv1IOSVycZyjtTLzEC85vWRwPTRJv/GxevjpdT4cg/+A
	A6VFep1AN0sbGmdHjpkA7j61KyZEmSg2aJtCHa04K/6OWL6jpNu7SDkr2rykgEiI5kmQ5FKoqSrqG
	hCaYSc6TMobpgKci8SZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8EuX-00DD25-Vj; Tue, 27 Jul 2021 04:41:46 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8EuH-00DCwT-9A
 for linux-mediatek@lists.infradead.org; Tue, 27 Jul 2021 04:41:30 +0000
Received: by mail-pl1-x635.google.com with SMTP id e14so14411174plh.8
 for <linux-mediatek@lists.infradead.org>; Mon, 26 Jul 2021 21:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qE4/SqkNnix+M7ct3sQdpg0XGV25TlRZol1gYI9jQFI=;
 b=SCeefJ6MY5kkt/BX3+hEMJXuqVRb7DbGmYWeLSrICIWjinaN+FKm5jW6v4DshennXn
 NTVN6p9TA9qhHO+woUgxz8TUN2f6WiPKk3E5Evj5azRnV5IxJPiQOLSJMWij4QT/13J8
 ZndpPOVcaTZ7xjSKLLzoWlCVq2dmtPo+XgR8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qE4/SqkNnix+M7ct3sQdpg0XGV25TlRZol1gYI9jQFI=;
 b=r0EDHyM9okjA1V0sMnpzQjKyn0gwIDuI9knTVHpaAXXl9TEbfEdMvHqI9qU3g2oPUM
 hTayxuXf3ynJLowmHvbvuAUkepwq2//ikdaYCfUX9WIGpxPjCj7Bjcgsl0vjmTy8jy/h
 nQyeXaQGMF8EtXcbQIdExAii9qYJmDbRfdqAjOq2HH4I4vZ6jFuewboENKsU/o+VkSm9
 2QFx0LVO1uYSwJfXenixdLBAf4z908rscBeg8POCtjWJ8OPVGSbwhWoTAg84lyz4jcG/
 HlYmSimNwQ+UvHXM+IBjvjJ4TUnW1bTt0YwnQhWb102DE+s3MULm/ETa3Tzkz36E+0zb
 6t3w==
X-Gm-Message-State: AOAM531HZD0OCOt83fFGlmMmkLDzveAKjv5JO3ilWDKxZPbYY1Tb9Jth
 A7gYSdpW/EAW4rE5frfQDMbFa+5CPy9GE7vNXZWhKQ==
X-Google-Smtp-Source: ABdhPJxtKF+/H1IGS0dCsxbFgQ/EnNk+IvHAoHpsU0C9gCRh2mE2O3I3otmdRgeARUulaPAzYLSWEqGjBM75ihdgrEI=
X-Received: by 2002:a17:90a:8403:: with SMTP id
 j3mr2300678pjn.112.1627360888489; 
 Mon, 26 Jul 2021 21:41:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com>
 <20210726105719.15793-12-chun-jie.chen@mediatek.com>
In-Reply-To: <20210726105719.15793-12-chun-jie.chen@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Tue, 27 Jul 2021 12:41:17 +0800
Message-ID: <CAATdQgDJhe7BvNHs0FgckMaS+XSDco4mGAyjAq6PrMFwpeL=bg@mail.gmail.com>
Subject: Re: [v14 11/21] clk: mediatek: Add MT8192 camsys clock support
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
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 Weiyi Lu <weiyi.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_214129_368685_2E6F9369 
X-CRM114-Status: UNSURE (   7.15  )
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

On Mon, Jul 26, 2021 at 7:08 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8192 camsys and camsys raw clock providers
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>

(snip)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
