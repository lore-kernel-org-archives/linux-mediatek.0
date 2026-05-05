Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A10FF8855
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2026 18:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p3booFeTa28qe7i7voEaW3UHK1wmjwWoETKgGZqVBKM=; b=K8GEOPOuPWIpM8c0ZIlUIozLxM
	8oPnsvVqpS3yYsDXptL7axZQROWb8DB2UGRhnDVvL2AcRigTRBQSm817As64J7CdaFgzKlZbvtJ90
	zauOHjdz+yUbDbB6SYJaK2pFVTUGMY8XGqF4ugBhubE7A6ZQ6zUGGgsF2M1axDp3Jv+5v1cE0gvSo
	druUUjs6zpexWnHuwanmWGP9tjXSdlFieRFY2KUx3aoIXuyWQWSC3aa2QwjjRoMduUyPgqpazVAXk
	G07xwBuNrpKLkvCRlWGgxzYrrdhKv7oKTRg+jpgjTPaRX61h1DwGR/A17zRBo5oJM/FRfG/i2ajv6
	IJRFleiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKKUT-0000000HAFJ-45m1;
	Tue, 05 May 2026 18:27:29 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKKUQ-0000000HADV-2iHV
	for linux-mediatek@lists.infradead.org;
	Tue, 05 May 2026 18:27:28 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-48d146705b4so15174645e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 05 May 2026 11:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778005645; x=1778610445; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=p3booFeTa28qe7i7voEaW3UHK1wmjwWoETKgGZqVBKM=;
        b=CJ4bsPrd/0fmsX+CNRfkfNfabC2hITmWYioUqKzF5NkBuDcR37pAujETysmzGWAEws
         l2MbqSETSxBf8UM03WmvHksD1vRNnCNgjNQ35N+di9+LWjouWp+TZiXJbUH5ZLH8KHnY
         r3ZO8Rw7xFXAt8V0ZzluuqG70ITe0JXpem0gVlc7SKwQxZuQobiE8rKV3RZQseItHiV9
         oEUpfO+3vBcoy7oDYippC+1oHTXw81sKTaNg+GwW/68uOI/2HcNiwfWXTpab58n5GOSo
         zKuWyi+xvsl8f/HDisX4X+UabNvhtE37S7vsBdD8fVG9UewXRn0SxaBOvD28kfbyNJNK
         NNuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778005645; x=1778610445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p3booFeTa28qe7i7voEaW3UHK1wmjwWoETKgGZqVBKM=;
        b=r7PCAmK664q8cV0oSeeC3hGoNJiPeg8rQz3LH9TzhxfuGuNq6W5+pPk38mdG3YU71h
         UnvtSiTKEzf0HDvNeJ+djORBuKN4FYad1YSwNE0VI7iS6PvzIE30yuGyK1392xoDdt9r
         FLl2EiEuuJ5higJGRj/13X+HjtztSRM2PnSSR8XA0coQTdWWznJnu/nry5xZ8GgM2TrC
         /E0hZppumStmHybb0MbWxtWKbnXbCABj7AaleB5/izVOHCCE4t9kybKdp6xq/c1KgIBa
         mDM9w2tQIxgFzdctqM3ieU9RMYDiJbpCVk75AfBC5OBIr6Qa1M7H5HmLi5Zrlc0i5MS7
         oLhA==
X-Forwarded-Encrypted: i=1; AFNElJ/oO0qT9YWSfstTUxqmgm1Kyaqk3p2k8awNr4AUhQXCeGHjQqzU6zMohLv1cz0Z5go9/T8E3e9VZKFHg2Oryg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyEwvWIBSi69HpPvJagu8G1fskagKtf1LuUCb3+BfIyt355utEh
	ssuxcPJ1LDNFHo+0sikitVRVoAVr3tQWtm/IEyiUKLPW3JCcdflS5Z+P
X-Gm-Gg: AeBDietSvrrtVMGLJDa6jQRrDsjy6rpVfk6cTzB/iY1IGi1xKOGIzqP609KJ8+UTYqk
	yBNXhjLdI/oExPGsXQrTCm9dQKXCTnsW3qZesl5COnQRAIzUwWvxPwKdk3MZ0nHdYCc/a46TjzT
	5nNGF6qik3xw6DgL6vzYx4AMU5HnTFdx6nJM1cJdwmxbK4SLS4LKL1toLnmTLvw9a3NbHeYF0hz
	kGGDHc1/s7Gnfd9YCp+B1/XWkk/pispY85omq/ITZCcp4KTibH391skBQesuCUBFtjzkRi3Xz2R
	Ck7CBvJjlycgpUJKG/lllxL5S7SOCnNf5xTbUlAVQZAX66unPrgdTYQd+GCxFYpyCXjmYydx6jJ
	owBM+ArrU+u1Re1T5ST8qCItSznOc/vPqXPQejsbPUa6mt+mdpyCvtWxZeEZMtwvmova8Ersuk8
	Ptrqg9+EI/MrcgFkQ1tcq0+XOGPxCRMS2PNXYc3lCVZapFTFMciMKgc7WmOcakgkorWEdmOXwZV
	65o6dg=
X-Received: by 2002:a05:600c:c494:b0:48a:592c:e632 with SMTP id 5b1f17b1804b1-48e51f42760mr5237455e9.16.1778005644350;
        Tue, 05 May 2026 11:27:24 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-59-227-65.retail.telecomitalia.it. [82.59.227.65])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48a820c865esm408208245e9.5.2026.05.05.11.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 11:27:23 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [net-next RFC PATCH v5 00/10] net: pcs: Introduce support for fwnode PCS
Date: Tue,  5 May 2026 20:27:01 +0200
Message-ID: <20260505182713.27644-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_112726_723431_F2FCEC17 
X-CRM114-Status: GOOD (  29.15  )
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

This series introduce a most awaited feature that is correctly
provide PCS with fwnode without having to use specific export symbol
and additional handling of PCS in phylink.

At times there were 2 different implementation (this and the one
from Sean) but Sean agreed that this can be picked and used in favor
of his implementation as long as his case with race condition is
correctly handled.

---
First the PCS fwnode:

The concept is to implement a producer-consumer API similar to other
subsystem like clock or PHY.

That seems to be the best solution to the problem as PCS driver needs
to be detached from phylink and implement a simple way to provide a
PCS while maintaining support for probe defer or driver removal.

To keep the implementation simple, the PCS driver devs needs some
collaboration to correctly implement this. This is O.K. as helper
to correctly implement this are provided hence it's really a matter
of following a pattern to correct follow removal of a PCS driver.

A PCS provider have to implement and call fwnode_pcs_add_provider() in
probe function and define an xlate function to define how the PCS
should be provided based on the requested interface and phandle spec
defined in fwnode (based on the #pcs-cells)

fwnode_pcs_get() is provided to provide a specific PCS declared in
fwnode at index.

A simple xlate function is provided for simple single PCS
implementation, fwnode_pcs_simple_get.

A PCS provider on driver removal should first call
fwnode_pcs_del_provider() to delete itself as a provider and then
release the PCS from phylink with phylink_release_pcs() under rtnl
lock.

---
Second PCS handling in phylink:

We have the PCS problem for the only reason that in initial
implementation, we permitted way too much flexibility to MAC driver
and things started to deviate. At times we couldn't think SoC
would start to put PCS outside the MAC hence it was OK to assume
they would live in the same driver. With the introduction of
10g in more consumer devices, we are observing a rapid growth
of this pattern with multiple PCS external to MAC.

To put a stop on this, the only solution is to give back to phylink
control on PCS handling and enforce more robust supported interface
definition from both MAC and PCS side.

It's suggested to read patch 0003 of this series for more info, here
a brief explaination of the idea:

This series introduce handling of PCS in phylink and try to deprecate
.mac_select_pcs.

Phylink now might contain a linked list of available PCS and
those will be used for PCS selection on phylink_major_config.

MAC driver needs to define pcs_interfaces mask in phylink_config
for every interface that needs a dedicated PCS.

These PCS needs to be provided to phylink at phylink_create time
by setting the available_pcs and num_available_pcs in phylink_config.
A helper to parse PCS from fwnode is provided
fwnode_phylink_pcs_parse() that will fill a preallocated array of
PCS. (the same function can be used to get the number of PCS
defined in DT, more info in patch 0005)

phylink_create() will fill the internal PCS list with the passed
array of PCS. phylink_major_config and other user of .mac_select_pcs
are adapted to make use of this new PCS list.

The supported interface value is also moved internally to phylink
struct. This is to handle late removal and addition of PCS.
(the bonus effect to this is giving phylink a clear idea of what
is actually supported by the MAC and his constraint with PCS)

The supported interface mask in phylink is done by OR the
supported_interfaces in phylink_config with every PCS in PCS list.

PCS removal is supported by forcing a mac_config, refresh the
supported interfaces and run a phy_resolve().

PCS late addition is supported by introducing a global notifier
for PCS provider. If a phylink have the pcs_interfaces mask not
zero, it's registered to this notifier.

PCS provider will emit a global PCS add event to signal any
interface that a new PCS might be avialable.

The function will then check if the PCS is related to the MAC
fwnode and add it accordingly.

A user for this new implementation is provided as an Airoha PCS
driver. This was also tested downstream with the IPQ95xx QCOM SoC
and with the help of Daniel also on the various Mediatek MT7988
SoC with both SFP cage implementation and DSA attached.

Lots of tests were done with driver unbind/bind and with interface
up/down also by adding print to make sure major_config_fail gets
correctly triggered and reset once the PCS comes back.

The dedicated commits have longer description on the implementation
so it's suggested to also check there for additional info.

It's worth to mention that OpenWrt is currently using this on
Mediatek SoC and QCOM ipq807x/ipq60xx/ipq50xx and Airoha are
already ported in staging tree for testing.

---

Changes v5:
- Rebase on top of net-next
- Use the new force_major_config
- Reword some comments and commit description
- Return -ENODEV instead of -EPROBE_DEFER to perevent race condition
- Drop phy_interface_copy patch (Russell pushed an equivalent version)
Changes v4:
- Move patch 0002 phy_interface_copy to 0002 (fix bisectability
  problem)
- Address review from Lorenzo for Airoha ethernet driver
- Fix kdoc error with missing Return (actually missing : before Return)
- Fix UNMET dependency reported error for CONFIG_FWNODE_PCS
- Revert to pcs.c instead of core.c (due to name conflict with other kmod)
- Fix clang compilation error for Airoha PCS driver
- Add missing inline function to pcs.h function
Changes v3:
- Out of RFC
- Fix various spelling mistake
- Drop circular dependency patch
- Complete Airoha Ethernet phylink integration
- Introduce .pcs_link_down PCS OP
Changes v2:
- Switch to fwnode
- Implement PCS provider notifier
- Better split changes
- Move supported_interfaces to phylink
- Add circular dependency patch
- Rework handling with indirect addition/removal and
  trigger of phylink_resolve()

Christian Marangi (10):
  net: phylink: keep and use MAC supported_interfaces in phylink struct
  net: phylink: introduce internal phylink PCS handling
  net: phylink: add phylink_release_pcs() to externally release a PCS
  net: pcs: implement Firmware node support for PCS driver
  net: phylink: support late PCS provider attach
  dt-bindings: net: ethernet-controller: permit to define multiple PCS
  net: phylink: add .pcs_link_down PCS OP
  dt-bindings: net: pcs: Document support for Airoha Ethernet PCS
  net: pcs: airoha: add PCS driver for Airoha SoC
  net: airoha: add phylink support for GDM2/3/4

 .../bindings/net/ethernet-controller.yaml     |    2 -
 .../bindings/net/pcs/airoha,pcs.yaml          |  112 +
 drivers/net/ethernet/airoha/Kconfig           |    1 +
 drivers/net/ethernet/airoha/airoha_eth.c      |  144 +-
 drivers/net/ethernet/airoha/airoha_eth.h      |    3 +
 drivers/net/ethernet/airoha/airoha_regs.h     |   12 +
 drivers/net/pcs/Kconfig                       |   13 +
 drivers/net/pcs/Makefile                      |    2 +
 drivers/net/pcs/pcs-airoha.c                  | 2921 +++++++++++++++++
 drivers/net/pcs/pcs.c                         |  241 ++
 drivers/net/phy/phylink.c                     |  280 +-
 include/linux/pcs/pcs-provider.h              |   41 +
 include/linux/pcs/pcs.h                       |  104 +
 include/linux/phylink.h                       |   15 +
 14 files changed, 3862 insertions(+), 29 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml
 create mode 100644 drivers/net/pcs/pcs-airoha.c
 create mode 100644 drivers/net/pcs/pcs.c
 create mode 100644 include/linux/pcs/pcs-provider.h
 create mode 100644 include/linux/pcs/pcs.h

-- 
2.53.0


