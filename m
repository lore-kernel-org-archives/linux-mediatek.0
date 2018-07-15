From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/8] Fix PCI I/O space page leaks
Date: Sun, 15 Jul 2018 19:00:21 +0300
Message-ID: <3e862a05-084a-d732-3060-6e2b234e9718@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-MW
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, Joao Pinto <Joao.Pinto@synopsys.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Rob Herring <robh@kernel.org>, Tanmay Inamdar <tinamdar@apm.com>, Ryder Lee <ryder.lee@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Hello!

Here's a set of 8 patches against the 'pci/controller-fixes' branch of Lorenzo
Pieralisi's 'pci.git' repo. They are the fixes for the PCI I/O space page leaks
(and the kernel BUG caused by them on deferred probe); those were 1st found
testing the R-Car PCIe driver. The patches are in the chronological order
(considering the date/time of the commits specified in the Fixes: tag), patches
#2..#8 depend on the patch #1 in order to build/work as it introduces the managed
device API that they all use...

[1/8] PCI: xgene: Fix I/O space page leak
[2/8] PCI: of: Fix I/O space page leak
[3/8] PCI: versatile: Fix I/O space page leak
[4/8] PCI: designware: Fix I/O space page leak
[5/8] PCI: aardvark: Fix I/O space page leak
[6/8] PCI: faraday: Fix I/O space page leak
[7/8] PCI: mediatek: Fix I/O space page leak
[8/8] PCI: v3-semi: Fix I/O space page leak

MBR, Sergei
