Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31229C28D13
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Aug 2022 07:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:CC:To:From:References:Subject:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nzd0TYYufJ0cvZMq/1825VGB80pelN1uNxD/ulxN3IE=; b=BMUy1h4wf7QWyDK38E6yZG9/Tu
	1lT6KxoNfyRnjnD1IZQEU3hVRSRQB1FUek26aVl3pnPESTCBiw7FOLr7tkw0vG6+faXyGNFkIhX0n
	tHHf8sDv0SX1Or6CW8aZak+ekZ396MM+BqqwHQ4Sfr6yap9HI0rL0KtFGip30gal6B/Qn4/EFgxkS
	5zJFZmtDckXKe4/M9JgPgN3Jzd8Bcn4wiVIEi/tZavkEhcSP2pUeA8eDiezGLhYKteX2+1Nk60YEl
	looXdTV9VuCith1PSFwEt4X1H59mJtjKz1ab77T8FVO4yq0JxUCdoHgu3mGzKmTjTTAnRkPqua80L
	JgLCvxFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ1TW-005l3j-ML; Mon, 22 Aug 2022 07:03:54 +0000
Received: from smtp-fw-33001.amazon.com ([207.171.190.10])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ1Sx-005krB-Uj; Mon, 22 Aug 2022 07:03:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1661151800; x=1692687800;
  h=references:from:to:cc:date:in-reply-to:message-id:
   mime-version:subject;
  bh=nzd0TYYufJ0cvZMq/1825VGB80pelN1uNxD/ulxN3IE=;
  b=EAmwdJa/ZdjHRVdiuA1FBCFLrpWh5vIuAEXMPDRxo7YiZCk2HETCkbLA
   kpgcAtsMwfNLLWBu3xcW4e5UEqbfq0XYX7q6/7Rvy3M5B7ee0/jggWdNb
   e415fk591DHLRykLiFSFBIRPsQIjYcpc+lKz3mZ1p8zgdyQgcY+qu7yrs
   c=;
X-IronPort-AV: E=Sophos;i="5.93,254,1654560000"; 
   d="scan'208";a="219871863"
Subject: Re: [PATCH] net: move from strlcpy with unused retval to strscpy
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-iad-1e-26daedd8.us-east-1.amazon.com) ([10.43.8.6])
  by smtp-border-fw-33001.sea14.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2022 07:02:58 +0000
Received: from EX13D28EUC001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
	by email-inbound-relay-iad-1e-26daedd8.us-east-1.amazon.com (Postfix) with ESMTPS id 4C09AE2EC5;
	Mon, 22 Aug 2022 07:02:54 +0000 (UTC)
Received: from u570694869fb251.ant.amazon.com.amazon.com (10.43.161.172) by
 EX13D28EUC001.ant.amazon.com (10.43.164.4) with Microsoft SMTP Server (TLS)
 id 15.0.1497.38; Mon, 22 Aug 2022 07:01:48 +0000
References: <20220818210050.7108-1-wsa+renesas@sang-engineering.com>
User-agent: mu4e 1.6.10; emacs 28.0.91
From: Shay Agroskin <shayagr@amazon.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
CC: <linux-kernel@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Jay Vosburgh <j.vosburgh@gmail.com>, Veaceslav
 Falico <vfalico@gmail.com>, Andy Gospodarek <andy@greyhouse.net>, Wolfgang
 Grandegger <wg@grandegger.com>, "Marc Kleine-Budde" <mkl@pengutronix.de>,
	Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vivien
 Didelot <vivien.didelot@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
	"Kurt Kanzenbach" <kurt@linutronix.de>, Steffen Klassert
	<klassert@kernel.org>, David Dillow <dave@thedillows.org>, Russell King
	<linux@armlinux.org.uk>, Ion Badulescu <ionut@badula.org>, Andreas Larsson
	<andreas@gaisler.com>, Mark Einon <mark.einon@gmail.com>, Lino Sanfilippo
	<LinoSanfilippo@gmx.de>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, "Jes
 Sorensen" <jes@trained-monkey.org>, Arthur Kiyanovski <akiyano@amazon.com>,
	David Arinzon <darinzon@amazon.com>, Noam Dagan <ndagan@amazon.com>, "Saeed
 Bishara" <saeedb@amazon.com>, Don Fry <pcnet32@frontier.com>, Tom Lendacky
	<thomas.lendacky@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Igor
 Russkikh <irusskikh@marvell.com>, Chris Snook <chris.snook@gmail.com>,
	Michael Chan <michael.chan@broadcom.com>, Broadcom internal kernel review
 list <bcm-kernel-feedback-list@broadcom.com>,
	=?utf-8?Q?Rafa=C5=82_Mi=C5=82eck?= =?utf-8?Q?i?= <rafal@milecki.pl>, Rasesh
 Mody <rmody@marvell.com>, <GR-Linux-NIC-Dev@marvell.com>, Ariel Elior
	<aelior@marvell.com>, Sudarsana Kalluru <skalluru@marvell.com>, "Manish
 Chopra" <manishc@marvell.com>, Doug Berger <opendmb@gmail.com>, "Siva Reddy
 Kallam" <siva.kallam@broadcom.com>, Prashant Sreedharan
	<prashant@broadcom.com>, Sunil Goutham <sgoutham@marvell.com>, "Raju Rangoju"
	<rajur@chelsio.com>, Ayush Sawal <ayush.sawal@chelsio.com>, "Vinay Kumar
 Yadav" <vinay.yadav@chelsio.com>, Rohit Maheshwari <rohitm@chelsio.com>,
	Hartley Sweeten <hsweeten@visionengravers.com>, Christian Benvenuti
	<benve@cisco.com>, Govindarajulu Varadarajan <_govind@gmx.com>, Denis
 Kirjanov <kda@linux-powerpc.org>, Ajit Khaparde <ajit.khaparde@broadcom.com>,
	Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>, Somnath Kotur
	<somnath.kotur@broadcom.com>, Madalin Bucur <madalin.bucur@nxp.com>, "Ioana
 Ciornei" <ioana.ciornei@nxp.com>, Claudiu Manoil <claudiu.manoil@nxp.com>,
	Joakim Zhang <qiangqing.zhang@nxp.com>, Pantelis Antoniou
	<pantelis.antoniou@gmail.com>, Li Yang <leoyang.li@nxp.com>, Yisen Zhuang
	<yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>, "Douglas
 Miller" <dougmill@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Nick Child <nnac123@linux.ibm.com>, "Jesse
 Brandeburg" <jesse.brandeburg@intel.com>, Tony Nguyen
	<anthony.l.nguyen@intel.com>, Guo-Fu Tseng <cooldavid@cooldavid.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni
	<thomas.petazzoni@bootlin.com>, Marcin Wojtas <mw@semihalf.com>, "Geetha
 sowjanya" <gakula@marvell.com>, Subbaraya Sundeep <sbhatta@marvell.com>,
	hariprasad <hkelam@marvell.com>, Taras Chornyi <tchornyi@marvell.com>, Mirko
 Lindner <mlindner@marvell.com>, Stephen Hemminger
	<stephen@networkplumber.org>, Felix Fietkau <nbd@nbd.name>, John Crispin
	<john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Mark Lee
	<Mark-MC.Lee@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Tariq
 Toukan <tariqt@nvidia.com>, Saeed Mahameed <saeedm@nvidia.com>, "Leon
 Romanovsky" <leon@kernel.org>, Ido Schimmel <idosch@nvidia.com>, "Petr
 Machata" <petrm@nvidia.com>, Bryan Whitehead <bryan.whitehead@microchip.com>,
	<UNGLinuxDriver@microchip.com>, Chris Lee <christopher.lee@cspi.com>, Jon
 Mason <jdmason@kudzu.us>, Simon Horman <simon.horman@corigine.com>, Rain
 River <rain.1986.08.12@gmail.com>, "Zhu Yanjun" <zyjzyj2000@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>, "Rahul Verma" <rahulv@marvell.com>, Shahed
 Shaikh <shshaikh@marvell.com>, "Heiner Kallweit" <hkallweit1@gmail.com>,
	<nic_swsd@realtek.com>, Jiri Pirko <jiri@resnulli.us>, Byungho An
	<bh74.an@samsung.com>, Edward Cree <ecree.xilinx@gmail.com>, Martin Habets
	<habetsm.xilinx@gmail.com>, "Ralf Baechle" <ralf@linux-mips.org>, Francois
 Romieu <romieu@fr.zoreil.com>, Daniele Venzano <venza@brownhat.org>, Nicolas
 Pitre <nico@fluxnic.net>, Steve Glendinning <steve.glendinning@shawell.net>,
	Jassi Brar <jaswinder.singh@linaro.org>, Ilias Apalodimas
	<ilias.apalodimas@linaro.org>, Kunihiko Hayashi
	<hayashi.kunihiko@socionext.com>, Giuseppe Cavallaro
	<peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>,
	Samuel Chessman <chessman@tux.org>, Geoff Levand <geoff@infradead.org>,
	Ishizaki Kou <kou.ishizaki@toshiba.co.jp>, Kevin Brace
	<kevinbrace@bracecomputerlab.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@xilinx.com>, Michal Simek <michal.simek@xilinx.com>,
	Krzysztof Halasa <khalasa@piap.pl>, "K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Dexuan
 Cui <decui@microsoft.com>, Sridhar Samudrala <sridhar.samudrala@intel.com>,
	Dave Jiang <dave.jiang@intel.com>, "Allen Hubbe" <allenbh@gmail.com>, Michael
 Hennerich <michael.hennerich@analog.com>, Petko Manolov
	<petkan@nucleusys.com>, Oliver Neukum <oneukum@suse.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Ronak Doshi
	<doshir@vmware.com>, "VMware PV-Drivers Reviewers" <pv-drivers@vmware.com>,
	David Ahern <dsahern@kernel.org>, Kalle Valo <kvalo@kernel.org>, Christian
 Lamparter <chunkeey@googlemail.com>, Simon Kelley <simon@thekelleys.org.uk>,
	"Larry Finger" <Larry.Finger@lwfinger.net>, Arend van Spriel
	<aspriel@gmail.com>, Franky Lin <franky.lin@broadcom.com>, Hante Meuleman
	<hante.meuleman@broadcom.com>, Stanislav Yakovlev <stas.yakovlev@gmail.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>, Jouni Malinen <j@w1.fi>, Ajay Singh
	<ajay.kathat@microchip.com>, Claudiu Beznea <claudiu.beznea@microchip.com>,
	Igor Mitsyanko <imitsyanko@quantenna.com>, Sergey Matyukevich
	<geomatsi@gmail.com>, Herton Ronaldo Krzesinski <herton@canonical.com>,
	Hin-Tak Leung <htl10@users.sourceforge.net>, <netdev@vger.kernel.org>,
	<linux-can@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-acenic@sunsite.dk>,
	<linux-parisc@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<intel-wired-lan@lists.osuosl.org>, <linux-mediatek@lists.infradead.org>,
	<linux-rdma@vger.kernel.org>, <oss-drivers@corigine.com>,
	<linux-mips@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-omap@vger.kernel.org>, <linux-hyperv@vger.kernel.org>,
	<ntb@lists.linux.dev>, <linux-usb@vger.kernel.org>,
	<virtualization@lists.linux-foundation.org>,
	<linux-wireless@vger.kernel.org>, <b43-dev@lists.infradead.org>,
	<brcm80211-dev-list.pdl@broadcom.com>, <SHA-cyfmac-dev-list@infineon.com>,
	<libertas-dev@lists.infradead.org>
Date: Mon, 22 Aug 2022 10:00:23 +0300
In-Reply-To: <20220818210050.7108-1-wsa+renesas@sang-engineering.com>
Message-ID: <pj41zlczcsep7s.fsf@u570694869fb251.ant.amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
X-Originating-IP: [10.43.161.172]
X-ClientProxiedBy: EX13D13UWA002.ant.amazon.com (10.43.160.172) To
 EX13D28EUC001.ant.amazon.com (10.43.164.4)
Precedence: Bulk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_000320_133646_2D944001 
X-CRM114-Status: GOOD (  12.59  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
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


Wolfram Sang <wsa+renesas@sang-engineering.com> writes:

> CAUTION: This email originated from outside of the 
> organization. Do not click links or open attachments unless you 
> can confirm the sender and know the content is safe.
>
>
>
> Follow the advice of the below link and prefer 'strscpy' in this
> subsystem. Conversion is 1:1 because the return value is not 
> used.
> Generated by a coccinelle script.
>
> Link: 
> https://lore.kernel.org/r/CAHk-=wgfRnXz0W3D37d01q3JFkr_i_uTL=V6A6G1oUZcprmknw@mail.gmail.com/
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
...
>  drivers/net/ethernet/amazon/ena/ena_ethtool.c    |  4 ++--
>  drivers/net/ethernet/amazon/ena/ena_netdev.c     |  2 +-

Reviewed-by: Shay Agroskin <shayagr@amazon.com>

