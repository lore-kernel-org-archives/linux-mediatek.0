Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E24FD706C
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2026 10:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iRfjqfC/TBsGVHqBrwzxSIT/mb5DrDQmAIZikbq0tmE=; b=MorYvuR5qxI/Uy7Nt9B86EPdD5
	NOnuAHXG4kodx4w+dm/LuQnLwrRjQiotQ6JsPcB2Gxfo5YUrBv5TlWXp4WUn/+ORGK3iP469FMQty
	cR2zPWADRTolXxVVivxWQ+hithGccyYyybG4KZWiAPfVrNaDk6J68Nbtr7Iy7X6mlaiPm8EXtHyKE
	a2E1aVX+eINSomJPHCJMNbzNHOFu9y9xBFvNMjzSnpF827EdgKeJfuYX/3vzDJeJURKIylVFbu4la
	1EWG9F4b7345mwZuq2I6UB/vzzQnjBJTLtSu6MxjhybZcIbz1uM9XJZTYHJMPI9Hjh4paSnTffCVk
	ow/JEVJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2RSk-00000005y24-1uN6;
	Tue, 17 Mar 2026 10:15:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2RSj-00000005y1R-00Aw
	for linux-mediatek@bombadil.infradead.org;
	Tue, 17 Mar 2026 10:15:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=iRfjqfC/TBsGVHqBrwzxSIT/mb5DrDQmAIZikbq0tmE=; b=TdJIbFWThRlXPthK7I2ICcKzpG
	1fWQrwbd2jXh7SUvMSM1/JmV0bKPvt/wxw43ar6OkD29XVP9/9wAh9S2p8p8YbVzMBQxVfEmms11r
	cT63ykavkErdldbGd9Z9Il5bwh3Dy5EymzBjHdfTNYFk3L+ZjnkQ2JSXvdZeJOdcKpMvRMTO+zbT7
	L8olDVy/VnGsxXvZJr0UDAYQ93INu1MzTmBixNdvYrZGQvNEJsMTQIzdExUPJP12aUosSd4J48lOK
	w7WaGUTX3kc0XW10OQy4D6YkeyNum8i/vgT8WKDQluZG3RsifAkpk9LPCrChmjvYHbwt+x1/g+uOW
	JOaI0VUA==;
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2RSf-00000008fPR-3z2k
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Mar 2026 10:15:43 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6615c461d3fso7107967a12.2
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Mar 2026 03:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773742540; x=1774347340; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iRfjqfC/TBsGVHqBrwzxSIT/mb5DrDQmAIZikbq0tmE=;
        b=if7S/bQPqr9YcJ94zITIuFqF0nFrAVhfyaPyj7Fmp8R3tpiB0+CVsNA8RsaqxAQJG9
         25UaHnqIFhFTkTwFYONLGmuktzn43If+gndS2G13JyjS8SfrzOyRG9pfhfQ1jYuM2PAi
         VnM1VwVFfPrn/uk1tMbEV8SaEX/VLmxWyDmkEkINvcOXueS1ZxlmuzcYA40OaQrsJG2M
         9/cz7xetDpgK4B1G3EfWZ3z5DVMKqcHCajTOMWGpkxFtVfUMAG56j9Ah10+VpIujgOq9
         J0TNw4FgFzFXIEXNXDCL1zb1Hdlk4vvACS/ClSmyW5/yBuggtw/APyNxodver6Ij5z72
         yjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773742540; x=1774347340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iRfjqfC/TBsGVHqBrwzxSIT/mb5DrDQmAIZikbq0tmE=;
        b=PbPEqvsuVHHaf00cyu4O/14qdqcTvM6LGZEPznFexGS2sLjVcWE+1ZE7VpwE7iFOAL
         gdQ8AJK0xXx9tO3+V8Lcj6h+1VEWjBVIqPmMc5qAaPFYIfGs4wWxDK9a/D4dP+mh55gO
         wNopd8vc8nPVRCl8cEa69pmKZxsn3JLHo4cg9u2lE2ZkrZ8rhXS3och1O9/ag//EbCTl
         H8dtTpEIfcaLXUhqZJ60of8oS8OZ0AGo3JnOfP/O1SWUt/ZxknMrm8qHccPm8HUr9voT
         bhmIPLVOw8tlKjRUiHZ5nf2k4kT9cwLz29xGrOhpJsgCC8UgeRnciEKuAtWMgq+4jV9a
         uVKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSq4wSZrFfzUGLCrXKodkqlWiDD5JOyZFcTuk/xdZWLPupgRy+3Mu+V8MnNFF6A8M6ypwrZnjyHDhHKdZI8A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzkmxI8QA3y9dF+IzE79gfnSGGXtwybvVs1wqwHXkZzl5mHD50S
	hLtv7zpVPBcs31OkoZSWx/Vx+efGlZEXhOaMVyR3b1dsNbwZN+EX5QHh
X-Gm-Gg: ATEYQzxarKznO3hDf6cSwTCkitnsgFq7EzyidpYxtFvHN+RRw3n0YFjOd0eaeZ+JLZ7
	DRxBtsneuLf/fuxJy23TglVd2mTtGL9VnXve3v1F0D4UWPJ2qA7vkVlHaj4nz4PF6mcZGrA2DIF
	mOlfN9xo9ND22/mfuasb+ijf0iX4Pb6hfvLN1wFfE4cG0Cdp6TJBhkiwCdIJcKMM7heV+e2qA0X
	B3R5AwD15SRn14IPezU+yAJ637IgZ4nyj7es7MgZ1y2RFO7ysq0Ah6txwe059RsXYVBh24aeF2a
	fYhGg+gkV7Vd7+km9Ivm9xwB5UCTZJy2lEF+MI7AJpi5qBVztScZ72QZ3Jd9y8SzvD8KENkfb0D
	UkejExlVS67TsWIG1FTp7YyC3B+7OnQTRejkhWr4dANt33n0iIMl80kBTK8RHozPjcQUAJtdJy5
	kb4GVBlYuKoasZrCWOfApIewkR4nx4wP5ReQciGjI1kOzY2r+nteg1gTHFH6Pzh+Rsj5e66/mM4
	hchLXeYJFKC0YEiPZ7qOwXZzFFyWTNfihOPSh0R6dpyHdzobC+bhpY=
X-Received: by 2002:a17:907:9343:b0:b97:3bbe:e432 with SMTP id a640c23a62f3a-b97650e9a55mr945539466b.23.1773742539481;
        Tue, 17 Mar 2026 03:15:39 -0700 (PDT)
Received: from eric (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9781914f96sm656674666b.47.2026.03.17.03.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 03:15:39 -0700 (PDT)
From: Eric Woudstra <ericwouds@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: netfilter-devel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Eric Woudstra <ericwouds@gmail.com>,
	Nikolay Aleksandrov <razor@blackwall.org>
Subject: [PATCH v12 nf-next] netfilter: nft_flow_offload: Add DEV_PATH_MTK_WDMA to nft_dev_path_info()
Date: Tue, 17 Mar 2026 11:15:25 +0100
Message-ID: <20260317101525.358016-1-ericwouds@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_101542_097848_DCA39033 
X-CRM114-Status: GOOD (  12.10  )
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

In case of using mediatek wireless, in nft_dev_fill_forward_path(), the
forward path is filled, ending with mediatek wlan1.

Because DEV_PATH_MTK_WDMA is unknown inside nft_dev_path_info() it returns
with info.indev = NULL. Then nft_dev_forward_path() returns without
setting the direct transmit parameters.

This results in a neighbor transmit, and direct transmit not possible.

So this patch adds DEV_PATH_MTK_WDMA to nft_dev_path_info() and makes
direct transmission possible.

(Also needed for flow between bridged interfaces, maybe implemented
later.)

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>
[ Rebased; moved to nf_flow_table_path.c ]

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>

---

Changes in v12:
 -Split from [PATCH v11 nf-next] netfilter: fastpath fixes

Changes in v11: (results of testing with bridge_fastpath.sh)
- Dropped "No ingress_vlan forward info for dsa user port" patch.
- Added Introduce DEV_PATH_BR_VLAN_KEEP_HW, which changed from
   applying only in the bridge-fastpath to all fastpaths. Added
   a better explanation to the description.

Changes in v10:
- Split from patch-set: bridge-fastpath and related improvements v9

 net/netfilter/nf_flow_table_path.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/netfilter/nf_flow_table_path.c b/net/netfilter/nf_flow_table_path.c
index 6bb9579dcc2a..f2d7822824bc 100644
--- a/net/netfilter/nf_flow_table_path.c
+++ b/net/netfilter/nf_flow_table_path.c
@@ -103,6 +103,7 @@ static void nft_dev_path_info(const struct net_device_path_stack *stack,
 		switch (path->type) {
 		case DEV_PATH_ETHERNET:
 		case DEV_PATH_DSA:
+		case DEV_PATH_MTK_WDMA:
 		case DEV_PATH_VLAN:
 		case DEV_PATH_PPPOE:
 		case DEV_PATH_TUN:
@@ -116,6 +117,10 @@ static void nft_dev_path_info(const struct net_device_path_stack *stack,
 				i = stack->num_paths;
 				break;
 			}
+			if (path->type == DEV_PATH_MTK_WDMA) {
+				i = stack->num_paths;
+				break;
+			}
 
 			/* DEV_PATH_VLAN, DEV_PATH_PPPOE and DEV_PATH_TUN */
 			if (path->type == DEV_PATH_TUN) {
-- 
2.53.0


