Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68547C369A2
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Apr 2025 14:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VUm9gQnvGQXKP6784F7H7/avPA/P9IgZ4HfULi58AjM=; b=VOkT2Yt74iBfYzz17ZmSH+7l5u
	5Iy2ndbl06JKpK1LfR+cCD4zld4JeEfHB5qxX4u8y5c00BVnaGP+2tfd0CvhWDYe3HGcCVZINNpVa
	JEb0hVyTS8WbAfErOYEgq5rh8gU7E0fR4ds6YNPfYHv5xh9yFPEZoECdsorY1Kr5seLjV4JrV3zpC
	pfF2VFy13fA2xZHKwob+F3A2Y7d8EkDFROp3c/d8ntjemBoCMd6yz6kyKV7iBC9obyT6YGkWNGawR
	XK075KoGHcEcZUx31GZq2lLU0/7aLahY1F/Ll7X6nQ1iwD/pOUxJ3HlCdTX3f1ASmjI/53giLArTM
	cbdf3k5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29vm-00000004NgD-1qeJ;
	Tue, 08 Apr 2025 14:28:02 +0000
Received: from mail-ej1-f52.google.com ([209.85.218.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29vG-00000004NRG-3iK0
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Apr 2025 14:27:32 +0000
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac25520a289so988034566b.3
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Apr 2025 07:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744122448; x=1744727248; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VUm9gQnvGQXKP6784F7H7/avPA/P9IgZ4HfULi58AjM=;
        b=DEiz6ZqMQX9eQ7KILbkLgOB2sNrLfDfsVyd+1AzXFuwWWEP+6/AkBIvxjBPqc2fo7s
         W8gUtsPHzGwaiwaPB6fxC2nn2DMUqDHJsBl4fKXbEdXjZPvNnhQFRKGUGjEjceZvi5//
         WMHATKpMpJO88NDq7pgKLxf81rBC1UKIocPuPbr8TzROBw6SfUwEMkxGwrT6noukhbEa
         s/Kq9cgPCuz35er/NWxNKnWZZSPn34buwZx/uWVd8BC4+fCPG/LpQ7M+IxZ97I+RcLG1
         191u276VjdHMNqnXTwgdxb6pNcn+zJVcAZ5Rdc+XoZ197zzEodJLX1z7aT6WoBl3ypAg
         gQBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744122448; x=1744727248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VUm9gQnvGQXKP6784F7H7/avPA/P9IgZ4HfULi58AjM=;
        b=kAEkGaJUc54hbpIpiDlZczJtkJCohKnusxGr8sCcb8nTbxQfz6eV+5JUhhbHUyvMMS
         q1kDylqhYu55FSv8airKneosz8ujSishHExjt6OKFUmwi+mOBpSpe16LpAQZ/YU44dj+
         IWI72C28W3bMHqdOBZC32tnhtMP4NN2JWjlRz6C3pGUaL7LqcMqslx5AL8d35XEQhHc0
         RCGaU5rZ6g8whLOZpNrcN6gUAUWfceAzTHoQlshmSw47SITWTjiddzizvJ3oPGpuceFz
         ZX4VCllqATRzpt3Co2tvw4ia8S1ojDndme1MPGC+Em+Wrnpuh6y7fK38WSh814OQI4ef
         LC+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXWI2UHA85N1mUdD3hq0gRjyA1KlRdMJOZh6dUKSf+dpArNIN5Lu6PhB6kSyb/1oDKDBrer51WcjakyYlBpXA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwvqYpG/fWJtaAfTLGI3MBDJYvyvLSRzu0u1CGmIW5YMICAWsIW
	yU/ir0PVieSxy+qIC03UekxESMSNyH+w52YROINWVUAcxEm4ZiUo
X-Gm-Gg: ASbGnct4515ln+IljVY4228W9aYgkfYYzI0qyQlc1TF9dA2c8eKfZ3rgkudeVP/LMKD
	vfcxWUeZgcPmOWLMy+bOmv+90MiRZMHOzaZUirJm6dCSo1oZk6WrGj/wze6o0NKH7xunaHNhGQw
	vH6v/q+jVtM7CT+1iDwzb9X0B9JQdrLJLLnTgno4CKgO7YutyZdmpL+lb9qd5NKrMGvUseoioHS
	ad8scE5+xtpuboIm7uby9UqsOjEJtf+sdPf50AfaT9DLoQPkaIlXYCllpsm4NH8Q8rFYTPkqNRA
	ZK4m2cHhAEcvpJC1wZKjtR/B7nepLscqgVOvNxtZPLcrRSvHv9RBtSeZgj+vMSNv3kHf5UbwIDv
	BhQAEGgnpBG5qTXdlByIomD9snWUNVnaU6LX/0pX3dSyWPqCuAXBU0Wlhxybqe8k=
X-Google-Smtp-Source: AGHT+IEp5c94V6eqD35x0nSO2wKRP1MNbXvTRnXfeguOXryVg+FDsmDVzBaz9Z5e3HCToWicMtFIDA==
X-Received: by 2002:a17:906:7310:b0:ac7:1350:e878 with SMTP id a640c23a62f3a-ac7d6e05c0bmr1509858666b.46.1744122448151;
        Tue, 08 Apr 2025 07:27:28 -0700 (PDT)
Received: from localhost.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe9be67sm910393266b.46.2025.04.08.07.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 07:27:27 -0700 (PDT)
From: Eric Woudstra <ericwouds@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jiri Pirko <jiri@resnulli.us>,
	Ivan Vecera <ivecera@redhat.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: netdev@vger.kernel.org,
	bridge@lists.linux.dev,
	netfilter-devel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Eric Woudstra <ericwouds@gmail.com>
Subject: [PATCH v11 nf-next 0/3] netfilter: fastpath fixes
Date: Tue,  8 Apr 2025 16:27:13 +0200
Message-ID: <20250408142716.95855-1-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_072730_922077_1661E956 
X-CRM114-Status: GOOD (  10.66  )
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

DEV_PATH_BR_VLAN_UNTAG_HW should not be applied to dsa foreign ports.

Also DEV_PATH_MTK_WDMA needs to be introduced to nft_dev_path_info().

Introduce DEV_PATH_BR_VLAN_KEEP_HW.

Changes in v11, results of testing with bridge_fastpath.sh:
- Dropped "No ingress_vlan forward info for dsa user port" patch.
- Added Introduce DEV_PATH_BR_VLAN_KEEP_HW, which changed from
   applying only in the bridge-fastpath to all fastpaths. Added
   a better explanation to the description.

v10 split from patch-set: bridge-fastpath and related improvements v9

Eric Woudstra (3):
  netfilter: nft_flow_offload: Add DEV_PATH_MTK_WDMA to
    nft_dev_path_info()
  bridge: No DEV_PATH_BR_VLAN_UNTAG_HW for dsa foreign
  bridge: Introduce DEV_PATH_BR_VLAN_KEEP_HW

 include/linux/netdevice.h        |  1 +
 include/net/switchdev.h          |  1 +
 net/bridge/br_device.c           |  1 +
 net/bridge/br_private.h          | 10 ++++++++++
 net/bridge/br_switchdev.c        | 15 +++++++++++++++
 net/bridge/br_vlan.c             | 23 ++++++++++++++++-------
 net/netfilter/nft_flow_offload.c |  8 ++++++++
 net/switchdev/switchdev.c        |  2 +-
 8 files changed, 53 insertions(+), 8 deletions(-)

-- 
2.47.1


