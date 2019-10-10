From: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 06/22] mtd: spi-nor: Rework read_fsr()
Date: Thu, 10 Oct 2019 09:14:42 +0200
Message-ID: <20191010091433.2977865a@dhcp-172-31-174-146.wireless.concordia.ca>
References: <20190924074533.6618-1-tudor.ambarus@microchip.com>
 <20190924074533.6618-7-tudor.ambarus@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190924074533.6618-7-tudor.ambarus@microchip.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tudor.Ambarus@microchip.com
Cc: linux-arm-kernel@lists.infradead.org, vigneshr@ti.com, geert+renesas@glider.be, andrew@aj.id.au, richard@nod.at, linux-kernel@vger.kernel.org, vz@mleia.com, marek.vasut@gmail.com, jonas@norrbonn.se, linux-mtd@lists.infradead.org, joel@jms.id.au, miquel.raynal@bootlin.com, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, computersforpeace@gmail.com, dwmw2@infradead.org, linux-aspeed@lists.ozlabs.org
List-Id: linux-mediatek@lists.infradead.org

On Tue, 24 Sep 2019 07:46:12 +0000
<Tudor.Ambarus@microchip.com> wrote:

> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> static int read_fsr(struct spi_nor *nor)
> becomes
> static int spi_nor_read_fsr(struct spi_nor *nor, u8 *fsr)
> 
> The new function returns 0 on success and -errno otherwise.
> We let the callers pass the pointer to the buffer where the
> value of the Flag Status Register will be written. This way
> we avoid the casts between int and u8, which can be confusing.
> 
> Prepend spi_nor_ to the function name, all functions should begin
> with that.
> 
> S/pr_err/dev_err and drop duplicated dev_err in callers, in case the
> function returns error.

Same comments as for patch 5.
