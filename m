Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D206C28B28
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Mar 2025 20:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OWCNG8MCvnV9bUc6X1qyMGw14Enxyxd+fZVYaRBs7C0=; b=BkuDAMr7tniV7UWEm8BYgjm+7x
	kPcO80Y7RH92YKj64I3+iWQzHe74TTwlCKOQdJeu1e0xqq5UdsdYQRNT+1JQNd4yXMWgpPQBibtPU
	NUnUhSrW9PWG9ulORMUMflC2U71C24wTsyWIwUG/MUWTAsSlm6OVDvotnWKaA7uryAsvS9uklhquk
	zINraYbvsrX137jJitSAiiukGzulU/Vo8FtgieE5z88R+Ixdk8E2qRZu9JC2pWWt7ArMbxjTLNGeP
	znFFv+/GNYgNDSYB2x6b8QKNfPWM75kK3aOR5XqDw+kJEfqEkX8gAp5M7CqeOIP5i4CSihfvfwAaU
	UNx4qk2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttXht-0000000Gmdy-0awr;
	Sat, 15 Mar 2025 20:02:05 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttXhp-0000000Gmcp-4Am9
	for linux-mediatek@lists.infradead.org;
	Sat, 15 Mar 2025 20:02:03 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ac34257295dso68690866b.2
        for <linux-mediatek@lists.infradead.org>; Sat, 15 Mar 2025 13:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742068920; x=1742673720; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OWCNG8MCvnV9bUc6X1qyMGw14Enxyxd+fZVYaRBs7C0=;
        b=m5F3V+VExS1uqiuANuleC5WXLiIuoCLaNGEhjOby66bFIW7xXVXC0nCFPLVSn9tIOy
         JlwYHykl3/PP9OJ9TCPd4EKwbN3XVytUKFKWWcFl33+ddj0tIUyVcYQPhEyMtsRpS4r/
         c1JJS6L1QVNfpPjHhxDAcb69xNYefGMhBh0C1nNGsQA/RxDWYp6ppjysKAeGXPZ9leb8
         x+msUjW685+7YIT0cNYzudflIOTQmeC4WKcVRIgH0lhfmA6jbvSovB8czZUcn3H981fp
         s42pN73eLPdHLsuG8mKifcE9a2EK8O0VUIYBZcrE8dXWHflkBvXIWtbp1WN2piPsJzfo
         C80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742068920; x=1742673720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OWCNG8MCvnV9bUc6X1qyMGw14Enxyxd+fZVYaRBs7C0=;
        b=pEFmeEolZil5HPmvSPM/qyh/WzZs7SHVsaf9BHHBpg3/20ahyKrjUXU19DCbovp8Dm
         gGXbBKSOWe45nf6uAhZpOzJo0oT50umVHAELW/6XzViy43PhorPPwBWDvqKh9f7qTczL
         N5Z3YCm1n2lNUEOox19QY/JgEkZ+jY1v/KfbOSUlCBt0wpdshksMXMUIVHxxMlbtg0Qw
         rLtM5fuZNc36uu3k5QMqVvfQGBW089ZYxla2r9PHd9sDN+f+ilN5yt1mqAWHwBWXGYj0
         mQeJ5WbNWsHk62jux3iD2EaF+CQN47jVFoBDhbS/Q+D/ersO2uOR+izMb4frxJpYBy39
         zKLA==
X-Forwarded-Encrypted: i=1; AJvYcCXx3AO4DxUA8pfQCpjtlqPG4Qf6BNVw54RYLCsDzKaGs7wzfFYUU3UeszEpBAfNezWqTHx8tn+Xpu7sBNqecA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzhcj/A6o7zwGNkdNvkFsu1wO0jcWGoBzfzR7Yc6FVlbcWmMqCJ
	cjxsmqs4b6T92DIIutY8lHH38b8qrY4wx7+TA8qTUzBq2OBQgl3R
X-Gm-Gg: ASbGncvcM1Rnw3TTYcfHgo8yzrnA2dhlYrTHXziwA/tSz3QTj5OsZv2wh4T937PmL88
	Ry0poXLjKDmMdOmclq913y7EJU4QrT+BS0MrxAeG+pW/nzKHXIBtkfeOVUi23Lhy6tM6lt66S1U
	d8LZCWhe4MGWw5lFp92FOHe0ZnQhrbk5kys+g4U7M2A3BTZyiKk0ezA5PDv1aFIzjbTxUnN3Lx+
	3YX3FF/FRWCEBbnE8+QyqECF4U7LrFXTWcLDc5q6v8G0C3rtFNg4YvU/FBTSOLwndRZ0bPNo/XJ
	dO54NKiw9ol39sf2AiYZv/pXOwTyEB7g8WM785GH7N8x2SCBTwMBaMJhpL5OzTDMWw8d8lJj+aP
	PhU0YGD6AhSVKGZWy6MRjeRTcUFs7+UufysSkzUbk5BZDY8rTACixpB4lQz3Fn2oJ8fQKyFS+eQ
	==
X-Google-Smtp-Source: AGHT+IF8gayXt91PRDutGk4V82DqfdZfU+ap3enKi/TuuDYAbCXOzpfh+hBjypvjScaqAOLFckwunQ==
X-Received: by 2002:a17:907:928c:b0:ac2:9a71:25ab with SMTP id a640c23a62f3a-ac33025412amr958629566b.16.1742068920017;
        Sat, 15 Mar 2025 13:02:00 -0700 (PDT)
Received: from localhost.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a489c9sm411456766b.152.2025.03.15.13.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 13:01:59 -0700 (PDT)
From: Eric Woudstra <ericwouds@gmail.com>
To: Jiri Pirko <jiri@resnulli.us>,
	Ivan Vecera <ivecera@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: netdev@vger.kernel.org,
	bridge@lists.linux.dev,
	netfilter-devel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Eric Woudstra <ericwouds@gmail.com>
Subject: [PATCH v10 nf-next 0/3] netfilter: fastpath fixes
Date: Sat, 15 Mar 2025 21:01:44 +0100
Message-ID: <20250315200147.18016-1-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_130202_049400_330EC17D 
X-CRM114-Status: UNSURE (   8.23  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Several fixes for the existing software forward-fastpath code, also
needed for the software bridge-fastpath.

DEV_PATH_BR_VLAN_UNTAG_HW should not be applied to dsa user-ports and
not to dsa foreign ports. Furthermore DEV_PATH_MTK_WDMA needs to be
introduced to nft_dev_path_info().

Split from patch-set: bridge-fastpath and related improvements v9

Eric Woudstra (3):
  netfilter: nft_flow_offload: Add DEV_PATH_MTK_WDMA to
    nft_dev_path_info()
  netfilter: nft_flow_offload: No ingress_vlan forward info for dsa user
    port
  bridge: No DEV_PATH_BR_VLAN_UNTAG_HW for dsa foreign

 include/net/switchdev.h          |  1 +
 net/bridge/br_private.h          | 10 ++++++++++
 net/bridge/br_switchdev.c        | 15 +++++++++++++++
 net/bridge/br_vlan.c             |  7 ++++++-
 net/netfilter/nft_flow_offload.c | 10 ++++++++++
 net/switchdev/switchdev.c        |  2 +-
 6 files changed, 43 insertions(+), 2 deletions(-)

-- 
2.47.1


