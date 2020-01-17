Return-Path: <SRS0=2M+Y=3G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1509C33C9E
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jan 2020 19:23:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C80A72083E
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jan 2020 19:23:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LNSfbYfb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="vh2gbirw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C80A72083E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dh9VJ9rd4kT6Rn2XgANHhSLL6iKMp1tbFTegAdG7sy8=; b=LNSfbYfbHzcNek
	Vz5HXeD13tUdTjDxoADnbxEYLaT4DwQ0iot59voeiz3Re12uodMd3xHqWX3C9hLi2ElYlb/yUcPZ3
	Jj1H4qlyxUmX8GenRjK4BJsOKyqsL7H0a+yZG0j7FOk6i/mxA4Wv1xEBZjyR24NYmSUeetLRPPXbi
	gfAi/8us1r1EJMVrqvVlZ6O1kRQnL4MNeTgJNCUxANihIs0fqPJRD3ff6SV2cgtTUBzNwAPoxsXq4
	8VC7tBAJERDAaE9SgCl2P0DwMV9s5a1LsLI9uE0uFNhPspNm+rbywkRWgjTN+NCCyjjsNZhnJseNc
	zZGQtXH6WI4v+2xdSSJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isXD5-0001i1-4Y; Fri, 17 Jan 2020 19:23:11 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isXCw-0001ar-TL
 for linux-mediatek@lists.infradead.org; Fri, 17 Jan 2020 19:23:04 +0000
Received: by mail-io1-xd41.google.com with SMTP id d15so27282699iog.3
 for <linux-mediatek@lists.infradead.org>; Fri, 17 Jan 2020 11:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e2vu/lUJwux/k4RdZ1tPxjjQtt4V6F/TAup6l5gSJnc=;
 b=vh2gbirwvq1DiMOuPyijgWfoO8nnHX6vBOHLiN4q0Ia2w8SCNnynpI7hTEqA3ytp/k
 Ba7eAsmYyijOBlgUtqrxDH9zl7pl61QpbAXj7KKwjEDTFSpVk5BzqYGJMnEZDUSA5j9O
 Eb9W78pEi6Gr+VpoRKjAqtWz3Sr5dYTX8ZoVaPLTgScnaZ2bB0xT4kN1g8LUzx0o3cA/
 8nJ8AJHHYJpMYo3YjwcuE/GOhDFMHPy68yA4t0HAzDe+eSa/bLi7u67jcsV8xWyTmjxo
 1UUtycvO1RVlMCewnV7qxEe1USyt/7iAAaPACa5JdOjrqxyQ8ohcOzyJhQDQW4tE/Oi0
 rJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e2vu/lUJwux/k4RdZ1tPxjjQtt4V6F/TAup6l5gSJnc=;
 b=JlLKaM3e5LWtN6SWSTWsPL5MGsjGx4vJYSOI09dkapeme8ue2TBHdUr80HG1hoUUYl
 7ZBgNJJMi28sJeCcVit6MXtT+GVkqRHxCZoI1bSB1anDfEoqUOp17+xj4RBRhw712/QD
 eR5IVRMKCxoKeDR04WueonNa3Guduo+RTWNLsiN8xrHz75Y0i5nrUGkNb8VJjPfjbnai
 43A77oYhkKZx9Rp5okmYjW9mL9ygsARhbfVXhqqBEjq7t2ytBPTRF2342g3zKJTMXmXG
 8xdWfMbKoOL2/pQdT96JDkXp/WK2/hHLzdZBOjwP7pT9QDT8PBfUS2yadbWDCAzMRaL6
 luYA==
X-Gm-Message-State: APjAAAUyR0BSxqhLCRchOC05qWUUsdZPHGHlOq8TKvzmSf9qJkry1Pz8
 gG3DUyF0Qx0BNwPGx3piISjj4dXiqHdDQ+1f2iIDKA==
X-Google-Smtp-Source: APXvYqzzh3ttpG23e1so0Co6lB12ueWkyIT4XvJkmwX9WC01HJ8uAzVg4UxNuFWBOM6ZAbUOR0kb3PC5Ljt4y1Ll5Ig=
X-Received: by 2002:a05:6602:21c2:: with SMTP id
 c2mr30095251ioc.278.1579288981727; 
 Fri, 17 Jan 2020 11:23:01 -0800 (PST)
MIME-Version: 1.0
References: <9b365e76-e346-f813-d750-d7cfd0d16e4e@gmail.com>
In-Reply-To: <9b365e76-e346-f813-d750-d7cfd0d16e4e@gmail.com>
From: Olof Johansson <olof@lixom.net>
Date: Fri, 17 Jan 2020 11:22:50 -0800
Message-ID: <CAOesGMgFXQzHRQVQNwZU7-jO=eqWT5Dv82RRicMP-dKXwbTfvA@mail.gmail.com>
Subject: Re: [GIT PULL] soc: mediatek: updates for v5.6
To: Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200117_112303_009584_33F85628 
X-CRM114-Status: GOOD (  11.56  )
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
Cc: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>,
 Mars Cheng <mars.cheng@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Mon, Jan 13, 2020 at 2:18 AM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
> Hi Olof,
> Hi ARnds,
>
> Please have a look on the following patches for mediatek soc drivers for v5.6
>
> I includes the stable branch v5.5-next/cmdq-stable which should also be merged
> in the DRM tree. I'm not very familiar with providing a stable tree, although I
> double-checked that in the pull request to the DRM tree the commit IDs are the
> same, I thought it is worth noting.

I'm a little confused as to how the dependencies are expected to line up here.

Does your non-DRM contents rely on the DRM pieces? If so, you need
them to be based on top of that branch to make sure they are
bisectable, not merge the DRM branch in on top (since a bisect might
land on a commit before the merge).

But... I also don't see how there's any actual dependency here? There
are a few cleanups, the DRM branch builds without them, and the branch
when checked out right before the DRM merge in your pull request, also
builds.


-Olof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
