Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4F7C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 04:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ld6HkBOBfFqrFN7vSVxGegm5lQKjgT56U0O8dVe9Yco=; b=rgQuJxk22s7iJ/
	QlzFehxV99iG642RB+PRYwZBHJzNATsFVkhx4bw1s5Fx7QLFsyOMLBfO8Yn5McxbyZxLZOnOl9V6N
	snmqMObnegABl7TGndjeYuoXDiRIoN77vPDeg9zlFt1A/essO4HnUmS9rW6yBjjvzUqT1TzG0GDBx
	Arjn6z5q0uGtgaiU9VaR4+gM7cafD7coVEg5WJXaxnpufVYv09xbKVMO+hzrAWnD8ZPeVUb4KaZZy
	z3c2zKQQowDC/H7Ppft1zt/TinGL6M87n6ED7b37RNKSVJ0IRVOJbwzsPXm/JFT8DGvt4S9BOXvu6
	EdKR4s/7KCbNlotOB3Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRReR-002d7H-9y; Tue, 08 Mar 2022 04:40:47 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRReO-002d6H-1K
 for linux-mediatek@lists.infradead.org; Tue, 08 Mar 2022 04:40:45 +0000
Received: by mail-pf1-x435.google.com with SMTP id g1so16342787pfv.1
 for <linux-mediatek@lists.infradead.org>; Mon, 07 Mar 2022 20:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=j7+ip+oxWRLl9656rm8jl0V3j8tN7hrFGr/zIiKB03k=;
 b=vYVlbsZ2GNxgUkflM3UI2Yl4zQoI0NjuO+druEsm9oIjrPivL/zZA4KHWJaaCBI9h8
 ymMyi+Tu6ep+HSLTFk4av+DLYG1KlNrEgiqRd/ksI1KTYHtls5+A1jFtxQH6Y4aE1yMV
 +f3jn11ujyDj+MaiGpFe/2ZDTFs0oZ2UyxnUVyWhS4965TWccx55RIPpmDmcAkZrftWi
 +sMwTtnKPtVfuBVMROh7iaBNj9SEZZyYj5UHbw15CMe+mhznitZvfzFN2J5QvY9mtmiu
 MG/jQc9d10ay3b35Yv6OyXpMlfKtdCJJ4YRV92NM6EYklEHHhzk0X2bsOKPco3IdFsZj
 GiUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=j7+ip+oxWRLl9656rm8jl0V3j8tN7hrFGr/zIiKB03k=;
 b=uW5l2dyL+g+F4W2oMTaEPXruczx0ZCBo5EA2HYEORGpv7AUl6c8A1wEuGjD2P6Jx6E
 XHTb7Z8QSMoCCUyQDibR7MRd80kZaKmYJutleqmrOZEKnvvn7m9aR43a7vK/Kzqui3hP
 TI9JmMOcYZXlly8YewKIz6kgn7CXLhPFg2IncjMn1qyOvWHHBSYg9ahEy6NsaRSLGwyh
 dFrmps+d6oxGQA3JEKqz2iaL4E+EoMyMZyCizLEP53SQS/ANhkyBOKHdbMYzBGXEm+cY
 B89yZBKyuyed/vtw6mqYIYnrfVQwJZNK9AONi3pXAU6DDfqjgMgzldO+cUd8cSGZPENu
 O1Ag==
X-Gm-Message-State: AOAM530nKZGM+xgz1NMqKyani/qIpaoTrXLJLHI3+KmMpmJH6MVE8YI8
 jkFH64guyidjVP7hOSVis1bkoQ==
X-Google-Smtp-Source: ABdhPJxmE71kOOa7pwUTgkBKicaxgWByq9zu6dCpOFWEyt2Fx7IFTLvqmQV2Cd013olm2iZcXnU0Tg==
X-Received: by 2002:a62:1a43:0:b0:4f6:ce73:d572 with SMTP id
 a64-20020a621a43000000b004f6ce73d572mr16545228pfa.69.1646714443061; 
 Mon, 07 Mar 2022 20:40:43 -0800 (PST)
Received: from localhost ([223.184.83.228]) by smtp.gmail.com with ESMTPSA id
 pc17-20020a17090b3b9100b001bf88fe5edcsm769661pjb.9.2022.03.07.20.40.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 20:40:42 -0800 (PST)
Date: Tue, 8 Mar 2022 10:10:40 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Tim Chang <jia-wei.chang@mediatek.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, fan.chen@mediatek.com,
 louis.yu@mediatek.com, roger.lu@mediatek.com, Allen-yy.Lin@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, hsinyi@google.com,
 Jia-Wei Chang <jia-wei.chang@mediatek.corp-partner.google.com>
Subject: Re: [PATCH 3/4] cpufreq: mediatek: clean up cpufreq driver
Message-ID: <20220308044040.6b53fpdaw4fonfui@vireshk-i7>
References: <20220307122151.11666-1-jia-wei.chang@mediatek.com>
 <20220307122151.11666-4-jia-wei.chang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220307122151.11666-4-jia-wei.chang@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_204044_103265_A9D8A48B 
X-CRM114-Status: GOOD (  12.84  )
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

On 07-03-22, 20:21, Tim Chang wrote:
> cleanup of naming, print log and comments.

As told by Krzysztof, this should be broken into several patches. One
patch for each rename, if you really need to do that.

You shouldn't just change "err" to "ret". It is fine if the driver
used "err" at some places and "ret" at others, but otherwise there is
no need of that change.

This should be easier for us to review, we aren't going to dig into
every minute change here, that you don't describe in the message, and
see if something is wrong. Please make this easier for us.

This patch alone may end up in 5-10 different patches.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
