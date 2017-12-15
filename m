From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v2 net-next 1/3] net: dsa: mediatek: add VLAN support for
 MT7530
Date: Sat, 16 Dec 2017 01:23:42 +0800
Message-ID: <201712160014.LEf8U1GS%fengguang.wu@intel.com>
References: <72a0a9f2748193bc02fed5e74c343aa5397348b7.1513136754.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <72a0a9f2748193bc02fed5e74c343aa5397348b7.1513136754.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: kbuild-all@01.org, davem@davemloft.net, andrew@lunn.ch, f.fainelli@gmail.com, vivien.didelot@savoirfairelinux.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Hi Sean,

I love your patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/0day-ci/linux/commits/sean-wang-mediatek-com/add-VLAN-support-to-DSA-MT7530/20171215-214450
reproduce:
        # apt-get install sparse
        make ARCH=x86_64 allmodconfig
        make C=1 CF=-D__CHECK_ENDIAN__


sparse warnings: (new ones prefixed by >>)


vim +1324 drivers/net/dsa/mt7530.c

  1305	
  1306	static const struct dsa_switch_ops mt7530_switch_ops = {
  1307		.get_tag_protocol	= mtk_get_tag_protocol,
  1308		.setup			= mt7530_setup,
  1309		.get_strings		= mt7530_get_strings,
  1310		.phy_read		= mt7530_phy_read,
  1311		.phy_write		= mt7530_phy_write,
  1312		.get_ethtool_stats	= mt7530_get_ethtool_stats,
  1313		.get_sset_count		= mt7530_get_sset_count,
  1314		.adjust_link		= mt7530_adjust_link,
  1315		.port_enable		= mt7530_port_enable,
  1316		.port_disable		= mt7530_port_disable,
  1317		.port_stp_state_set	= mt7530_stp_state_set,
  1318		.port_bridge_join	= mt7530_port_bridge_join,
  1319		.port_bridge_leave	= mt7530_port_bridge_leave,
  1320		.port_fdb_add		= mt7530_port_fdb_add,
  1321		.port_fdb_del		= mt7530_port_fdb_del,
  1322		.port_fdb_dump		= mt7530_port_fdb_dump,
  1323		.port_vlan_filtering	= mt7530_port_vlan_filtering,
> 1324		.port_vlan_prepare	= mt7530_port_vlan_prepare,
> 1325		.port_vlan_add		= mt7530_port_vlan_add,
  1326		.port_vlan_del		= mt7530_port_vlan_del,
  1327	};
  1328	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
