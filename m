Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF45F42125
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Apr 2026 18:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qsgRA3p07udg3yvwZj4yYVr8WYpzyG8nPfQlLNhFOXg=; b=BUHfsCPidqWnuBip3RO+HbiCDm
	6JZyFB3GdCPbw0YoVgKU6VDZyKMh1PqUYInQXBwfBKT1Z2sWAI95VBGeFNb2X0LZhaFfqi1qpYYIv
	oC03Io1v5rYcYBrA9aEcveZ7k1gDi+xVODAUsX9H73XqMNlcanalKfOw1cXv9uxA3pT5BKABuA+Oa
	p0OBtEVjOJlTniBetVN17sNDFGfgMONWQmXBqDTFKXyYvL/RRxBT59wev2jE0CWqenZeEFJHEHeu0
	G90RFrOSaVc1GjNP55koemqy2yS4phdhvSDzir/ESuhsPJVboVPPJq3BCVT2de/3hcwIOdDGwxz+m
	RqcerNMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD4rs-00000001VAi-3Raz;
	Wed, 15 Apr 2026 18:21:40 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD4rp-00000001VAJ-2bpB
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Apr 2026 18:21:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776277297; x=1807813297;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XJ0ClRbSg4l93ZE5ItlZyjuoNUTZDhfKK3msAUNdUEg=;
  b=V+RHqHgHlGIBj4eD4sH2mnL2SNrdOA9kl0Souo9LCDHl5YY3+FWCzUBS
   8IT/7OTr1QgoC/L01EqREU0Za4KzCWwy9rwNbaoalEoyEkfip3jA/gIDn
   3TeUklP+VluDMAQHLIvV1HjISJD81F/WoyDCUisDMteHAGEYmnSyYHhYI
   aTKLVPjb7ln97q/i5C9hhdkTfGxeuK8iLBIQgKosbGjiV6RQTmhEYBB45
   xEtgeZ9J84R6yJalJB61GbAzMtnBKUUnPddlYFLKkZ9viLClMocgp1h7q
   bnTWbhVCefzUauJovMXHEBdTgsVn0vQ6GYlJ5N0038usrAmkcQV/TJqjA
   A==;
X-CSE-ConnectionGUID: +KCwvF+FQvKR9ofruF4BpQ==
X-CSE-MsgGUID: Y/YrwcyGQU2PivyPTsePkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="88348995"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="88348995"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 11:21:36 -0700
X-CSE-ConnectionGUID: 2s4QI947TAmHKa83H5judw==
X-CSE-MsgGUID: Gsf3lCWySn+1FylbqjlQEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="225794151"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 15 Apr 2026 11:21:33 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wD4rj-000000000oc-0dXU;
	Wed, 15 Apr 2026 18:21:31 +0000
Date: Thu, 16 Apr 2026 02:20:44 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Lu <chris.lu@mediatek.com>, Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Von Dentz <luiz.dentz@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Sean Wang <sean.wang@mediatek.com>,
	Will Lee <will-cy.Lee@mediatek.com>, SS Wu <ss.wu@mediatek.com>,
	Steve Lee <steve.lee@mediatek.com>,
	linux-bluetooth <linux-bluetooth@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-mediatek <linux-mediatek@lists.infradead.org>,
	Chris Lu <chris.lu@mediatek.com>
Subject: Re: [PATCH v3] Bluetooth: btmtk: add event filter to filter specific
 event
Message-ID: <202604160237.pgNaPPAX-lkp@intel.com>
References: <20260412090242.1129701-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412090242.1129701-1-chris.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_112137_705991_83BE7DF4 
X-CRM114-Status: GOOD (  14.27  )
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

Hi Chris,

kernel test robot noticed the following build errors:

[auto build test ERROR on bluetooth/master]
[also build test ERROR on bluetooth-next/master linus/master v7.0 next-20260414]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chris-Lu/Bluetooth-btmtk-add-event-filter-to-filter-specific-event/20260415-122458
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git master
patch link:    https://lore.kernel.org/r/20260412090242.1129701-1-chris.lu%40mediatek.com
patch subject: [PATCH v3] Bluetooth: btmtk: add event filter to filter specific event
config: x86_64-randconfig-161-20260415 (https://download.01.org/0day-ci/archive/20260416/202604160237.pgNaPPAX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9007-gcf3ea02b
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260416/202604160237.pgNaPPAX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604160237.pgNaPPAX-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/bluetooth/btusb.o: in function `btusb_probe':
>> drivers/bluetooth/btusb.c:4142:(.text+0x6c1a): undefined reference to `btmtk_recv_event'


vim +4142 drivers/bluetooth/btusb.c

  4023	
  4024	static int btusb_probe(struct usb_interface *intf,
  4025			       const struct usb_device_id *id)
  4026	{
  4027		struct usb_endpoint_descriptor *ep_desc;
  4028		struct gpio_desc *reset_gpio;
  4029		struct btusb_data *data;
  4030		struct hci_dev *hdev;
  4031		unsigned ifnum_base;
  4032		int i, err, priv_size;
  4033	
  4034		BT_DBG("intf %p id %p", intf, id);
  4035	
  4036		if ((id->driver_info & BTUSB_IFNUM_2) &&
  4037		    (intf->cur_altsetting->desc.bInterfaceNumber != 0) &&
  4038		    (intf->cur_altsetting->desc.bInterfaceNumber != 2))
  4039			return -ENODEV;
  4040	
  4041		ifnum_base = intf->cur_altsetting->desc.bInterfaceNumber;
  4042	
  4043		if (!id->driver_info) {
  4044			const struct usb_device_id *match;
  4045	
  4046			match = usb_match_id(intf, quirks_table);
  4047			if (match)
  4048				id = match;
  4049		}
  4050	
  4051		if (id->driver_info == BTUSB_IGNORE)
  4052			return -ENODEV;
  4053	
  4054		if (id->driver_info & BTUSB_ATH3012) {
  4055			struct usb_device *udev = interface_to_usbdev(intf);
  4056	
  4057			/* Old firmware would otherwise let ath3k driver load
  4058			 * patch and sysconfig files
  4059			 */
  4060			if (le16_to_cpu(udev->descriptor.bcdDevice) <= 0x0001 &&
  4061			    !btusb_qca_need_patch(udev))
  4062				return -ENODEV;
  4063		}
  4064	
  4065		data = kzalloc_obj(*data);
  4066		if (!data)
  4067			return -ENOMEM;
  4068	
  4069		for (i = 0; i < intf->cur_altsetting->desc.bNumEndpoints; i++) {
  4070			ep_desc = &intf->cur_altsetting->endpoint[i].desc;
  4071	
  4072			if (!data->intr_ep && usb_endpoint_is_int_in(ep_desc)) {
  4073				data->intr_ep = ep_desc;
  4074				continue;
  4075			}
  4076	
  4077			if (!data->bulk_tx_ep && usb_endpoint_is_bulk_out(ep_desc)) {
  4078				data->bulk_tx_ep = ep_desc;
  4079				continue;
  4080			}
  4081	
  4082			if (!data->bulk_rx_ep && usb_endpoint_is_bulk_in(ep_desc)) {
  4083				data->bulk_rx_ep = ep_desc;
  4084				continue;
  4085			}
  4086		}
  4087	
  4088		if (!data->intr_ep || !data->bulk_tx_ep || !data->bulk_rx_ep) {
  4089			kfree(data);
  4090			return -ENODEV;
  4091		}
  4092	
  4093		if (id->driver_info & BTUSB_AMP) {
  4094			data->cmdreq_type = USB_TYPE_CLASS | 0x01;
  4095			data->cmdreq = 0x2b;
  4096		} else {
  4097			data->cmdreq_type = USB_TYPE_CLASS;
  4098			data->cmdreq = 0x00;
  4099		}
  4100	
  4101		data->udev = interface_to_usbdev(intf);
  4102		data->intf = intf;
  4103	
  4104		INIT_WORK(&data->work, btusb_work);
  4105		INIT_WORK(&data->waker, btusb_waker);
  4106		INIT_DELAYED_WORK(&data->rx_work, btusb_rx_work);
  4107	
  4108		skb_queue_head_init(&data->acl_q);
  4109	
  4110		init_usb_anchor(&data->deferred);
  4111		init_usb_anchor(&data->tx_anchor);
  4112		spin_lock_init(&data->txlock);
  4113	
  4114		init_usb_anchor(&data->intr_anchor);
  4115		init_usb_anchor(&data->bulk_anchor);
  4116		init_usb_anchor(&data->isoc_anchor);
  4117		init_usb_anchor(&data->diag_anchor);
  4118		init_usb_anchor(&data->ctrl_anchor);
  4119		spin_lock_init(&data->rxlock);
  4120	
  4121		priv_size = 0;
  4122	
  4123		data->recv_event = hci_recv_frame;
  4124		data->recv_bulk = btusb_recv_bulk;
  4125	
  4126		if (id->driver_info & BTUSB_INTEL_COMBINED) {
  4127			/* Allocate extra space for Intel device */
  4128			priv_size += sizeof(struct btintel_data);
  4129	
  4130			/* Override the rx handlers */
  4131			data->recv_event = btintel_recv_event;
  4132			data->recv_bulk = btusb_recv_bulk_intel;
  4133		} else if (id->driver_info & BTUSB_REALTEK) {
  4134			/* Allocate extra space for Realtek device */
  4135			priv_size += sizeof(struct btrealtek_data);
  4136	
  4137			data->recv_event = btusb_recv_event_realtek;
  4138		} else if (id->driver_info & BTUSB_MEDIATEK) {
  4139			/* Allocate extra space for Mediatek device */
  4140			priv_size += sizeof(struct btmtk_data);
  4141	
> 4142			data->recv_event = btmtk_recv_event;
  4143		}
  4144	
  4145		data->recv_acl = hci_recv_frame;
  4146	
  4147		hdev = hci_alloc_dev_priv(priv_size);
  4148		if (!hdev) {
  4149			kfree(data);
  4150			return -ENOMEM;
  4151		}
  4152	
  4153		hdev->bus = HCI_USB;
  4154		hci_set_drvdata(hdev, data);
  4155	
  4156		data->hdev = hdev;
  4157	
  4158		SET_HCIDEV_DEV(hdev, &intf->dev);
  4159	
  4160		reset_gpio = gpiod_get_optional(&data->udev->dev, "reset",
  4161						GPIOD_OUT_LOW);
  4162		if (IS_ERR(reset_gpio)) {
  4163			err = PTR_ERR(reset_gpio);
  4164			goto out_free_dev;
  4165		} else if (reset_gpio) {
  4166			data->reset_gpio = reset_gpio;
  4167		}
  4168	
  4169		hdev->open    = btusb_open;
  4170		hdev->close   = btusb_close;
  4171		hdev->flush   = btusb_flush;
  4172		hdev->send    = btusb_send_frame;
  4173		hdev->notify  = btusb_notify;
  4174		hdev->wakeup  = btusb_wakeup;
  4175		hdev->hci_drv = &btusb_hci_drv;
  4176	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

